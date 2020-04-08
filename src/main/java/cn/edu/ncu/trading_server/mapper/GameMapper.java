package cn.edu.ncu.trading_server.mapper;

import cn.edu.ncu.trading_server.entity.Game;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface GameMapper {
    int deleteByPrimaryKey(Integer gameId);

    int insert(Game record);

    int insertSelective(Game record);

    Game selectByPrimaryKey(Integer gameId);

    int updateByPrimaryKeySelective(Game record);

    int updateByPrimaryKey(Game record);
}