package cc.c2appstore.service.Impl;

import cc.c2appstore.mapper.TeamMapper;
import cc.c2appstore.model.entity.Team;
import cc.c2appstore.service.TeamService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TeamServiceImpl implements TeamService {

    private TeamMapper teamMapper;
    @Autowired
    public void setTeamMapper(TeamMapper teamMapper) {
        this.teamMapper = teamMapper;
    }

    @Override
    public List<Team> selectByProductId(Long project_id) {
        List<Team> teams= teamMapper.selectByProductId(project_id);


        teams.forEach(team->{

        });


        ObjectMapper mapper=new ObjectMapper();
        //String json=mapper.writeValueAsString("");

        return null;
    }
}
