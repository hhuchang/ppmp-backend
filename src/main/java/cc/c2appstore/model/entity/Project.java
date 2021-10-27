package cc.c2appstore.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;


import java.io.Serializable;
import java.util.Date;

@Data
@TableName(value = "project_tbl")
public class Project implements Serializable {

    private static final long serialVersionUID = -8841047290425476998L;
    @TableId(type = IdType.AUTO)
    private Long projectId;
    private String projectCode;
    private String projectName;
    @JsonIgnore
    private Integer managerId;
    @TableField(exist = false)
    private User manager;//private Integer managerId;

    @JsonIgnore
    private Integer projectTypeId;
    @TableField(exist = false)
    private ProjectType type;//private Integer projectType;

    @JsonIgnore
    @TableField("createBy_id")
    private Integer createById;
    @TableField(exist = false)
    private User createBy;//private Integer createById;

    private Date createdDate;
    private Date updateDate;
    private Date startTime;
    private Date endTime;
    private String img;




    //@JsonIgnore
    //private Integer status_id;

    @TableField(exist = false)
    private ProjectStatus status;//private Integer status;
    private String remarks;


}
