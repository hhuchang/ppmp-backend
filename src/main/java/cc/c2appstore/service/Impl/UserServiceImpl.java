package cc.c2appstore.service.Impl;

import cc.c2appstore.mapper.UserMapper;
import cc.c2appstore.model.entity.User;
import cc.c2appstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> list() {
        return userMapper.selectList(null);
    }
}
