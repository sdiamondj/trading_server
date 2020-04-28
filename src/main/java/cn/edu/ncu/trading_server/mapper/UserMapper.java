package cn.edu.ncu.trading_server.mapper;

import cn.edu.ncu.trading_server.dto.UserLoginDTO;
import cn.edu.ncu.trading_server.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User userLogin(UserLoginDTO dto);

    User selectByPhone(Long userPhone);

    int selectCount();

    List<User> selectAll();

}