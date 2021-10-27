package cc.c2appstore.mapper;

import cc.c2appstore.model.entity.Project;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author: changcan
 * @date: 2021/10/26 0:06
 */
@Mapper
public interface ProjectMapper extends BaseMapper<Project> {


    @Results({
            @Result(column = "manager_id",property = "manager",
                    one = @One(select = "cc.c2appstore.mapper.UserMapper.selectById")),
            @Result(column = "project_type_id",property = "type",
                    one = @One(select = "cc.c2appstore.mapper.ProjectTypeMapper.selectById")),
            @Result(column = "createBy_id",property = "createBy",
                    one = @One(select = "cc.c2appstore.mapper.UserMapper.selectById")),
            @Result(column = "status_id",property = "status",
                    one = @One(select = "cc.c2appstore.mapper.ProjectStatusMapper.selectById")),
    })
    @Select("select * from project_tbl")
    List<Project> selectList(@Param(Constants.WRAPPER) Wrapper<Project> queryWrapper);


}
