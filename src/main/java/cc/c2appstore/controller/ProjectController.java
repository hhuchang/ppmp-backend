package cc.c2appstore.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: changcan
 * @date: 2021/10/25 23:24
 */
@RestController
@RequestMapping("/project")
public class ProjectController {
    @GetMapping("/list")
    public String list(){
        return "project list";

    }
}
