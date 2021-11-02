package cc.c2appstore.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.util.List;

@Data
public class Team {
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;

    private Long projectId;

    @JsonIgnore
    private Long jobId;

    @TableField(exist = false)
    private Job job;


    @TableField(exist = false)
    private List<JobUser> jobUsers;





}
