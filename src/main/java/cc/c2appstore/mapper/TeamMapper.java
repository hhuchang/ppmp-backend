package cc.c2appstore.mapper;

import cc.c2appstore.model.entity.Team;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TeamMapper extends BaseMapper<Team> {
    List<Team> selectByProductId(Long project_id);
}
