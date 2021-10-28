package cc.c2appstore.mapper;

import cc.c2appstore.model.entity.Project;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author: changcan
 * @date: 2021/10/26 0:06
 */
@Mapper
public interface ProjectMapper extends BaseMapper<Project> {

    IPage<Project> selectPage(Page<Project> page, @Param(Constants.WRAPPER) Wrapper<Project> queryWrapper);
}
