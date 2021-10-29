package cc.c2appstore.service.Impl;

import cc.c2appstore.mapper.ProjectTypeMapper;
import cc.c2appstore.model.entity.ProjectType;
import cc.c2appstore.service.ProjectTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProjectTypeServiceImpl implements ProjectTypeService {
    @Autowired
    private ProjectTypeMapper projectTypeMapper;

    @Override
    public List<ProjectType> list() {
        return projectTypeMapper.selectList(null);
    }
}
