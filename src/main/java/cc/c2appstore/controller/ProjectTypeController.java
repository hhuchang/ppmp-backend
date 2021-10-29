package cc.c2appstore.controller;



import cc.c2appstore.model.entity.ProjectType;
import cc.c2appstore.service.ProjectTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/project/type")
public class ProjectTypeController {

    @Autowired
    private ProjectTypeService projectTypeService;

    @GetMapping
    public List<ProjectType> list(){

        return projectTypeService.list();

    }


}
