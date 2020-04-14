package cn.edu.ncu.trading_server.mapper;

import cn.edu.ncu.trading_server.entity.Good;

public interface GoodMapper {
    int deleteByPrimaryKey(Integer goodsId);

    int insert(Good record);

    int insertSelective(Good record);

    Good selectByPrimaryKey(Integer goodsId);

    int updateByPrimaryKeySelective(Good record);

    int updateByPrimaryKey(Good record);
}