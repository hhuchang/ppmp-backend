package cc.c2appstore.model.vo;


import lombok.Data;

import java.util.List;

@Data
public class DocTreeVo {
    private Long key;
    private String title;
    private List<DocTreeVo> children;

}
