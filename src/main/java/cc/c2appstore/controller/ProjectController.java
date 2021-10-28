package cc.c2appstore.controller;

import cc.c2appstore.model.dto.ProjectListQueryDTO;
import cc.c2appstore.model.entity.Project;
import cc.c2appstore.model.vo.ProjectResp;
import cc.c2appstore.model.vo.ProjectListVo;
import cc.c2appstore.service.ProjectService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;

import org.springframework.web.bind.annotation.*;



/**
 * @author changcan
 * @date 2021/10/25 23:24
 *

 * {
 *   current: 2,
 *   pageSize: 20
 *   filter: {
 *   status:[ "created", "initialized" ]
 *   }
 *   projectCode: "code"
 *   projectName: "name"
 *   searchEndTime: ’2021-10-22 00:00:00‘
 *   searchStartTime: ”2021-11-22 00:00:00“
 *   sorter: {
 *      createAt: "ascend",
 *      projectName: "descend"
 *   }
 * }
 *
 * GET /zoos：列出所有动物园      安全且幂等
 * POST /zoos：新建一个动物园    不安全且不幂等
 * GET /zoos/ID：获取某个指定动物园的信息
 * PUT /zoos/ID：更新某个指定动物园的信息（提供该动物园的全部信息）    不安全但幂等
 * PATCH /zoos/ID：更新某个指定动物园的信息（提供该动物园的部分信息）
 * DELETE /zoos/ID：删除某个动物园
 * GET /zoos/ID/animals：列出某个指定动物园的所有动物
 * DELETE /zoos/ID/animals/ID：删除某个指定动物园的指定动物         不安全但幂等
 *
 *
 * GET /project 列出所有的project
 * POST /project  新建project
 * GET /project/ID 获取id=ID 的信息  project_tbl 表
 *
 * PUT /project/ID  修改
 * DELETE /project/ID 删除
 *
 * GET  /project/ID/details 获取id=ID project的detail
 * PUT  /
 */
@RestController
@RequestMapping("/project")
public class ProjectController {


    private ProjectService projectService;
    @Autowired
    public void setProjectService(ProjectService projectService){
        this.projectService=projectService;
    }

    @GetMapping
    public ResponseEntity<ProjectListVo> list(@Nullable @RequestBody(required = false) ProjectListQueryDTO dto){
        return new ResponseEntity<ProjectListVo>(projectService.selectPage(dto), HttpStatus.OK);
    }

    @GetMapping("/{pid}")
    public ResponseEntity<Project> selectById(@PathVariable("pid") Integer project_id){
        Project project =projectService.selectById(project_id);
        HttpStatus status = project !=null ? HttpStatus.OK : HttpStatus.NOT_FOUND;


        return new ResponseEntity<>(project,status);


    }


    /**
     * 增加project  一条
     * @param project
     * @return 辅导费
     */
    @PostMapping
    public ResponseEntity<ProjectResp> add(Project project){
        int result=projectService.add(project);

        HttpStatus status = result == 1 ? HttpStatus.OK : HttpStatus.NOT_FOUND;
        ProjectResp resp=new ProjectResp(status.value(),"添加成功",project);

        return new ResponseEntity<>(resp,status);

    }

    @PutMapping
    public ResponseEntity<ProjectResp> update(Project project){
        int result=projectService.update(project);

        HttpStatus status = result == 1 ? HttpStatus.OK : HttpStatus.NOT_FOUND;
        ProjectResp resp=new ProjectResp(status.value(),"修改成功",project);

        return new ResponseEntity<>(resp,status);
    }




}
