package cc.c2appstore.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

@Data
public class Project implements Serializable {

    private static final long serialVersionUID = -8841047290425476998L;
    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    private String projectCode;
    private String projectName;

}
