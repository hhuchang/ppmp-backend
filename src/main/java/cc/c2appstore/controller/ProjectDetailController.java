package cc.c2appstore.controller;


import cc.c2appstore.model.entity.ProjectDetail;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/project/detail")
public class ProjectDetailController {
    @GetMapping("/{pid}")
    public ResponseEntity<ProjectDetail> selectByProjectId(@PathVariable("pid") Integer project_id){

        return null;

    }

    @PostMapping
    public ResponseEntity<ProjectDetail> addDetailByProjectId(ProjectDetail projectDetail){

        return null;

    }


    @PutMapping
    public ResponseEntity<ProjectDetail> updateDetail(ProjectDetail projectDetail){
        return null;
    }


}
