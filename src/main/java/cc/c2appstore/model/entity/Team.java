package cc.c2appstore.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.util.List;

@Data
public class Team {
    private Long id;

    private Long projectId;

    @JsonIgnore
    private Long jobUserId;
    @TableField(exist = false)
    private List<JobUser> jobUser;



}
