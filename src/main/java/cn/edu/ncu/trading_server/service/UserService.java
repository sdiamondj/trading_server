package cn.edu.ncu.trading_server.service;

import cn.edu.ncu.trading_server.config.MyUtil;
import cn.edu.ncu.trading_server.dto.UserLoginDTO;
import cn.edu.ncu.trading_server.entity.User;
import cn.edu.ncu.trading_server.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public User userLogin(UserLoginDTO userLoginDTO){
        User user = userMapper.userLogin(userLoginDTO);
        return user;
    }

    public int getUserCount(){
        return userMapper.selectCount();
    }

    public Map<String,Integer> getCounts(){
        Map<String,Integer> map = new HashMap<>();
        map.put("userCount",userMapper.selectCount());
        map.put("noSexCount",userMapper.selectCountBySex(0));
        map.put("boyCount",userMapper.selectCountBySex(1));
        map.put("girlCount",userMapper.selectCountBySex(2));
        return map;
    }

    public static<T> List<T> listUtil(List<T> list,int page,int limit){
        if(list.size() <= limit){
            return list;
        }else{
            if((page-1)*limit+limit <= list.size()){
                return list.subList((page-1)*limit,(page-1)*limit+limit);
            }else{
                return list.subList((page-1)*limit,list.size());
            }
        }
    }

    public List<User> getUserList(int page,int limit){
        List<User> list = userMapper.selectAll();
        return listUtil(list,page,limit);
    }

    public User getUserById(int id){
        return userMapper.selectByPrimaryKey(id);
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

    public int updateUser(User oldUser,String nickname,String password,byte sex,String url){
        oldUser.setUserNickname(nickname);
        if(!password.equals("")){
            try {
                oldUser.setUserPassword(MyUtil.md5(password));
            }catch (Exception e){
                //
            }
        }
        oldUser.setUserSex(sex);
        if(url != null && !"".equals(url)){
            oldUser.setUserAvatar(url);
        }
        return userMapper.updateByPrimaryKeySelective(oldUser);
    }

    public int addAdmin(User user){
        return userMapper.updateByPrimaryKeySelective(user);
    }

    public int deleteUser(int userId){
        return userMapper.deleteByPrimaryKey(userId);
    }

}
