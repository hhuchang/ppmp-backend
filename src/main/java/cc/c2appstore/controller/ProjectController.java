package cc.c2appstore.controller;

import cc.c2appstore.mapper.ProjectMapper;
import cc.c2appstore.model.dto.ProjectListQueryDTO;
import cc.c2appstore.model.dto.Sorter;
import cc.c2appstore.model.entity.Project;
import cc.c2appstore.model.entity.ProjectStatus;
import cc.c2appstore.model.vo.ProjectVo;
import cc.c2appstore.service.ProjectService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;
import java.util.Locale;

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
 */
@RestController
//@RequestMapping("/project")
public class ProjectController {




    private ProjectService projectService;
    @Autowired
    public void setProjectService(ProjectService projectService){
        this.projectService=projectService;
    }

    @GetMapping("/project")
    public ProjectVo list(@Nullable @RequestBody(required = false) ProjectListQueryDTO dto){
        return projectService.selectPage(dto);
    }
}
