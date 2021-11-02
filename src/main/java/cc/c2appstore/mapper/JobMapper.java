package cc.c2appstore.mapper;

import cc.c2appstore.model.entity.Job;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.io.Serializable;

@Mapper
public interface JobMapper extends BaseMapper<Job> {


}
