package cn.edu.ncu.trading_server.service;

import cn.edu.ncu.trading_server.entity.User;
import cn.edu.ncu.trading_server.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public User getUser(){
        User user = userMapper.selectByPrimaryKey(6);
        return user;
    }

}
