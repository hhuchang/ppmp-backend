package cc.c2appstore.model.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class ProjectStatus implements Serializable {
    private static final long serialVersionUID = 1888995330145073630L;
    private Integer id;
    private String statusCode;
    private String statusName;
}
