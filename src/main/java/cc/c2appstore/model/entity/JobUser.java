package cc.c2appstore.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.util.List;
@Data
public class JobUser {

    private Long id;

    @JsonIgnore
    private Long jobId;

    @TableField(exist = false)
    private Job job;

    @JsonIgnore
    private Long userId;
    @TableField(exist = false)
    private List<User> user;

}
