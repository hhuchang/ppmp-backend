package cc.c2appstore.service.Impl;

import cc.c2appstore.mapper.ProjectMapper;
import cc.c2appstore.model.dto.ProjectListQueryDTO;
import cc.c2appstore.model.dto.Sorter;
import cc.c2appstore.model.entity.Project;
import cc.c2appstore.model.vo.ProjectVo;
import cc.c2appstore.service.ProjectService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
@Service
public class ProjectServiceImpl implements ProjectService {


    private ProjectMapper projectMapper;
    @Autowired
    public void setProjectMapper(ProjectMapper projectMapper) {
        this.projectMapper = projectMapper;
    }

    @Override
    public ProjectVo selectPage(ProjectListQueryDTO params) {
        Page<Project> pageProject;

        QueryWrapper<Project> queryWrapper=new QueryWrapper<>();
        if (params!=null) {
            Integer current = params.getCurrent();
            Integer pageSize = params.getPageSize();

            pageProject = new Page<>(current == null ? 1 : current, pageSize == null ? 10 : pageSize);

            String projectCode=params.getProjectCode();
            String projectName= params.getProjectName();
            String searchStartTime=params.getSearchStartTime();
            String searchEndTime=params.getSearchEndTime();

            Sorter sorter=params.getSorter();
            if(sorter!=null){
                String createAtSort= sorter.getCreateAt();
                if(!StringUtils.isEmpty(createAtSort)){
                    queryWrapper.orderBy(true,createAtSort.substring(0,createAtSort.length()-3).equalsIgnoreCase("asc"),"created_date");

                }
                String projectNameSort=sorter.getProjectName();
                if (!StringUtils.isEmpty(projectNameSort)){
                    queryWrapper.orderBy(true,projectNameSort.substring(0,projectNameSort.length()-3).equalsIgnoreCase("asc"),"project_name");

                }
            }

            if(!StringUtils.isEmpty(projectCode)){
                queryWrapper.like("project_code",projectCode);
            }
            if(!StringUtils.isEmpty(projectName)){
                queryWrapper.like("project_name",projectName);
            }
            if(!StringUtils.isEmpty(searchStartTime)){
                queryWrapper.ge("created_date",searchStartTime);
            }
            if(!StringUtils.isEmpty(searchEndTime)){
                queryWrapper.le("created_date",searchEndTime);
            }

        }else{
            pageProject=new Page<>(1,10);
        }


        IPage<Project> projectPage=projectMapper.selectPage(pageProject,queryWrapper);

        ProjectVo vo=new ProjectVo();
        vo.setCurrent(projectPage.getCurrent());
        vo.setPageSize(projectPage.getSize());
        vo.setTotal(projectPage.getTotal());
        vo.setData(projectPage.getRecords());

        return vo;
    }
}
