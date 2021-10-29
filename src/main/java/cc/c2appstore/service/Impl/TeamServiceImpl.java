package cc.c2appstore.service.Impl;

import cc.c2appstore.mapper.TeamMapper;
import cc.c2appstore.model.entity.Team;
import cc.c2appstore.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TeamServiceImpl implements TeamService {
    @Autowired
    private TeamMapper teamMapper;

    @Override
    public List<Team> selectByProductId(Long project_id) {
        return teamMapper.selectByProductId(project_id);
    }
}
