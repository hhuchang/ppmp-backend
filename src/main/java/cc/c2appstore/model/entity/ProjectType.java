package cc.c2appstore.model.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @author: changcan
 * @date: 2021/10/26 0:05
 */
@Data
public class ProjectType implements Serializable {

    private static final long serialVersionUID = -4783343882231461410L;
    private Integer id;

    private String typeName;

}
