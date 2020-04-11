package cn.edu.ncu.trading_server.service;

import cn.edu.ncu.trading_server.dto.UserLoginDTO;
import cn.edu.ncu.trading_server.entity.User;
import cn.edu.ncu.trading_server.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public User userLogin(UserLoginDTO userLoginDTO){
        User user = userMapper.userLogin(userLoginDTO);
        return user;
    }

    public int userRegister(UserLoginDTO userLoginDTO){
        User user = userMapper.selectByPhone(userLoginDTO.getUserPhone());

        if(user != null){
            return 0;
        }else{
            user = new User();
            user.setUserPhone(userLoginDTO.getUserPhone());
            user.setUserPassword(userLoginDTO.getUserPassword());
            return userMapper.insertSelective(user);
        }
    }

}
