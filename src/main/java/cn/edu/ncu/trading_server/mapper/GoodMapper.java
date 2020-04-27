package cn.edu.ncu.trading_server.mapper;

import cn.edu.ncu.trading_server.entity.Good;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface GoodMapper {
    int deleteByPrimaryKey(Integer goodsId);

    int insert(Good record);

    int insertSelective(Good record);

    Good selectByPrimaryKey(Integer goodsId);

    int updateByPrimaryKeySelective(Good record);

    int updateByPrimaryKey(Good record);

    List<Good> selectAll();

    List<Good> selectByGame(int gameId);

    List<Good> selectByTarget(String target);

    List<Good> selectAllCanBuy();

    List<Good> selectBySeller(int seller);

    List<Good> selectByState(int state);

}