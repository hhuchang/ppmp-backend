package cc.c2appstore.service;

import cc.c2appstore.model.entity.Team;

import java.util.List;

public interface TeamService {
    List<Team> selectByProductId(Long project_id);
}
