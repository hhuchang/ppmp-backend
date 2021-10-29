package cc.c2appstore.model.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * 职务
 *
 *
 *
 */

@Data
public class Job implements Serializable {


    private Long id;
    private String jobName;
    private String jobCode;

}
