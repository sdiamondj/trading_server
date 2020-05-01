package cn.edu.ncu.trading_server.mapper;

import cn.edu.ncu.trading_server.entity.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
@Mapper
public interface OrderMapper {
    int deleteByPrimaryKey(Integer orderId);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer orderId);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    List<Order> getOrderByBuyer(int buyer);

    List<Order> getOrderByGoodId(int goodId);

    List<Order> selectAll();

    List<Order> selectByState(short state);

    int selectCountIsSubmit(@Param("goodId")int goodId,@Param("buyerId")int buyerId);

    List<Order> selectByDate(String date);
}