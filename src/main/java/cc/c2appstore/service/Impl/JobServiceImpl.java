package cc.c2appstore.service.Impl;

import cc.c2appstore.mapper.JobMapper;
import cc.c2appstore.model.entity.Job;
import cc.c2appstore.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImpl implements JobService {
    @Autowired
    private JobMapper jobMapper;

    @Override
    public List<Job> list() {
        return jobMapper.selectList(null);
    }
}
