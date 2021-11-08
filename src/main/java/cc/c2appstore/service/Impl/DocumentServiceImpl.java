package cc.c2appstore.service.Impl;

import cc.c2appstore.mapper.DocumentMapper;
import cc.c2appstore.model.entity.Document;
import cc.c2appstore.model.vo.DocTreeVo;
import cc.c2appstore.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author changcan
 * @date 2021/11/05 14:10
 */
@Service
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    private DocumentMapper documentMapper;

    @Override
    public List<Document> listByProjectIdAndParentId(Long projectId, Long parentId) {
        return documentMapper.listByProjectIdAndParentId(projectId,parentId);
    }

    @Override
    public List<DocTreeVo> getTreeByProjectId(Long project_id) {
        //List<Document> root = documentMapper.listByProjectIdAndParentId(project_id, 0L);

        //递归 程序

        return handleList(project_id,0L);


    }

    List<DocTreeVo> handleList(Long project_id,Long parent_id){
        List<Document> sample = documentMapper.listByProjectIdAndParentId(project_id, parent_id);
        List<DocTreeVo> docTreeVoList=null;
        if(sample!=null&&sample.size()>0) {
            docTreeVoList = new ArrayList<>();
            for (Document doc : sample) {
                if ("file".equals(doc.getType())) continue;
                DocTreeVo docTreeVo = new DocTreeVo();
                docTreeVo.setKey(doc.getId());
                docTreeVo.setTitle(doc.getFileName());
                docTreeVo.setChildren(handleList(project_id,doc.getId()));

                docTreeVoList.add(docTreeVo);
            }
        }

        return docTreeVoList;

    }



//    List<DocTreeVo> handleList2(List<Document> sample,Long project_id){
//        List<DocTreeVo> docTreeVoList=new ArrayList<>();
//        for (Document doc:sample) {
//            if("file".equals(doc.getType())) continue;
//            DocTreeVo docTreeVo=new DocTreeVo();
//            docTreeVo.setKey(doc.getId());
//            docTreeVo.setTitle(doc.getFileName());
//            List<Document> documents = documentMapper.listByProjectIdAndParentId(project_id, doc.getId());
//            if(documents!=null&&documents.size()>0){
//
//
//                docTreeVo.setChildren(handleList(documents,project_id));
//            }
//            docTreeVoList.add(docTreeVo);
//        }
//
//        return docTreeVoList;
//
//    }
}
