package cc.c2appstore.service.Impl;

import cc.c2appstore.mapper.DocumentMapper;
import cc.c2appstore.model.entity.Document;
import cc.c2appstore.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author changcan
 * @date 2021/11/05 14:10
 */
@Service
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    private DocumentMapper documentMapper;

    @Override
    public List<Document> listByProjectIdAndParentId(Long projectId, Long parentId) {
        return documentMapper.listByProjectIdAndParentId(projectId,parentId);
    }
}
