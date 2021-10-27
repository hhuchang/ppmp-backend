package cc.c2appstore.model.vo;

import cc.c2appstore.model.entity.Project;
import lombok.Data;

import java.util.List;

@Data
public class ProjectVo {
    private Integer current;
    private Integer pageSize;
    private Long total;
    private List<Project> data;
}
