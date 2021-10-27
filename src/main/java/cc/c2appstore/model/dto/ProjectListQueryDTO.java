package cc.c2appstore.model.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class ProjectListQueryDTO implements Serializable {



    private static final long serialVersionUID = -2398262270823998806L;

    /**
     * {
     *   current: 2,
     *   pageSize: 20
     *   filter: {
     *   status:[ "created", "initialized" ]
     *   }
     *   projectCode: "code"
     *   projectName: "name"
     *   searchEndTime: ’2021-10-22 00:00:00‘
     *   searchStartTime: ”2021-11-22 00:00:00“
     *   sorter: {
     *      createAt: "ascend",
     *      projectName: "descend"
     *   }
     * }
     */
    private Integer current;
    private Integer pageSize;
    private Filter filter;
    private String projectCode;
    private String projectName;
    private String searchStartTime;
    private String searchEndTime;
    private Sorter sorter;



}



