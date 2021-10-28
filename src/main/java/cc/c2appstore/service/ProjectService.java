package cc.c2appstore.service;

import cc.c2appstore.model.dto.ProjectListQueryDTO;
import cc.c2appstore.model.vo.ProjectVo;
import org.springframework.stereotype.Service;

/**
 * @author: changcan
 * @date: 2021/10/26 0:06
 */

public interface ProjectService {

    ProjectVo selectPage(ProjectListQueryDTO params);
}
