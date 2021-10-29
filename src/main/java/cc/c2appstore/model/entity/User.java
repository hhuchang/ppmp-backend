package cc.c2appstore.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author changcan
 * @date 2021/10/26 0:05
 *
 *
 *
 *
 */
@Data
@TableName("user_tbl")
public class User implements Serializable {
    private static final long serialVersionUID = 3143789624666378205L;
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String userName;
    private String realName;
    private String avatar;

    private Date createdDate;
    private Date updateDate;

    private Date lastLogin;

    private Integer status;

    //private String remarks;





}
