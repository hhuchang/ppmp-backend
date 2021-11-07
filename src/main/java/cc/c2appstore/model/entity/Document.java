package cc.c2appstore.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@TableName("tb_document")
public class Document implements Serializable {

    private static final long serialVersionUID = -5753980899368374997L;
    @TableId(type = IdType.AUTO)
    private Long id;
    private String fileName;
    private Long projectId;
    private String type;
    private String savePath;
    private Long parentId;
    private String md5;
    private Integer size;
    private String suffix;
    private Date createdDate;
    private Date updateDate;
    private Long createBy;
    private Integer status;




}
