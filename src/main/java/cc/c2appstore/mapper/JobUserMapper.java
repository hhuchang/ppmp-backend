package cc.c2appstore.mapper;

import cc.c2appstore.model.entity.JobUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.io.Serializable;


public interface JobUserMapper extends BaseMapper<JobUser> {

    JobUser selectById(Serializable id);
    JobUser selectByTeamId(Serializable team_id);
}
