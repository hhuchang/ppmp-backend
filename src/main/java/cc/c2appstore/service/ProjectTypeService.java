package cc.c2appstore.service;

import cc.c2appstore.model.dto.ProjectListQueryDTO;
import cc.c2appstore.model.entity.Project;
import cc.c2appstore.model.entity.ProjectType;
import cc.c2appstore.model.vo.ProjectListVo;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author  changcan
 * @date 2021/10/26 0:06
 */

public interface ProjectTypeService {

    List<ProjectType> list();


}
