package cc.c2appstore.controller;


import cc.c2appstore.model.entity.Document;

import cc.c2appstore.model.vo.DocTreeVo;
import cc.c2appstore.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/doc")
public class DocumentController {

    @Autowired
    private DocumentService documentService;


    @GetMapping("/project/{project_id}/parent/{parent_id}")
    public List<Document> listByProjectIdAndParentId(@PathVariable Long project_id,@PathVariable Long parent_id){

        List<Document> documents=documentService.listByProjectIdAndParentId(project_id,parent_id);
        return documents;

    }

    @GetMapping("/tree/project/{project_id}")
    public List<DocTreeVo> tree(@PathVariable Long project_id,@PathVariable Long parent_id){
        return documentService.getTreeByProjectId(project_id);

    }

    /**
     * 在  文件路径下  新建文件夹  （新建文件  暂时不支持 ）
     * 返回  操作结果
     */
    @GetMapping("/mkdir/project/{project_id}/parent/{parent_id}")
    public Object mkdir(@PathVariable Long project_id,@PathVariable Long parent_id){
        //parent_id  如果是文件 则无法创建

        //文件名


        return null;
    }

    @DeleteMapping
    public Object rmdir(@PathVariable Long fileId){
        //如果 文件夹&& 文件夹下  有 children ,则 给出 确认 提示


        return null;
    }

    //重命名
    @PutMapping("/rename")
    public Object rename(@PathVariable Long fileId){

        return null;
    }
    //转移  移动

    @PutMapping("/move")
    public Object move(@PathVariable Long fileId,Long to_parent_id){
        //支持 同样的project 转移  暂不支持  跨  project 项目 移动

        return null;
    }












}
