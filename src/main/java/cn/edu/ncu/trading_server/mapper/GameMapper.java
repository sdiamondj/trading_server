package cn.edu.ncu.trading_server.mapper;

import cn.edu.ncu.trading_server.entity.Game;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface GameMapper {
    int deleteByPrimaryKey(Integer gameId);

    int insert(Game record);

    int insertSelective(Game record);

    Game selectByPrimaryKey(Integer gameId);

    int updateByPrimaryKeySelective(Game record);

    int updateByPrimaryKey(Game record);

    List<Game> selectAll();

    List<Game> selectOfType(short gameType);

    List<Game> selectByTarget(String target);

}