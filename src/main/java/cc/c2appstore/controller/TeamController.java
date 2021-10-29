package cc.c2appstore.controller;

import cc.c2appstore.model.entity.JobUser;
import cc.c2appstore.model.entity.Team;
import cc.c2appstore.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@RestController
@RequestMapping("/team")
public class TeamController {

    @Autowired
    private TeamService teamService;

    /**
     * 将 人员可以  变动  增加职位 增加 人员
     *
     * 默认 有一个模板  可以再次 基础上 增加 减少人员
     *
     * 先实现 现成的  模板
     *
     */

    @GetMapping("/{pid}")
    public List<JobUser> selectByProductId(@PathVariable("pid") Long project_id){
        return teamService.selectByProductId(project_id);


    }



}
