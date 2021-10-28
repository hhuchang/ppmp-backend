package cc.c2appstore.service;

import cc.c2appstore.model.dto.ProjectListQueryDTO;
import cc.c2appstore.model.entity.Project;
import cc.c2appstore.model.vo.ProjectListVo;

/**
 * @author: changcan
 * @date: 2021/10/26 0:06
 */

public interface ProjectService {

    ProjectListVo selectPage(ProjectListQueryDTO params);

    int add(Project project);

    int update(Project project);

    Project selectById(Integer pid);
}
