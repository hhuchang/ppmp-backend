package cc.c2appstore.service;

import cc.c2appstore.model.entity.Document;
import cc.c2appstore.model.vo.DocTreeVo;

import java.util.List;

/**
 * @author changcan
 * @date 2021/11/05 14:10
 */

public interface DocumentService {
    List<Document> listByProjectIdAndParentId(Long projectId, Long parentId);

    List<DocTreeVo> getTreeByProjectId(Long project_id);
}
