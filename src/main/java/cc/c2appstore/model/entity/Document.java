package cc.c2appstore.model.entity;

import lombok.Data;

import java.io.Serializable;
@Data
public class Document implements Serializable {

    private static final long serialVersionUID = -5753980899368374997L;
    private Long fileId;
    private String fileName;

    private String url;


}
