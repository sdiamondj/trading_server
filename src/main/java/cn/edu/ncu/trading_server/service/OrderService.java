package cn.edu.ncu.trading_server.service;

import cn.edu.ncu.trading_server.entity.Good;
import cn.edu.ncu.trading_server.entity.Order;
import cn.edu.ncu.trading_server.mapper.GoodMapper;
import cn.edu.ncu.trading_server.mapper.OrderMapper;
import cn.edu.ncu.trading_server.vo.OrderVO;
import com.sun.tools.corba.se.idl.constExpr.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private GoodMapper goodMapper;

    public int submitOrder(int buyer,int goods,String account){
        Order order =new Order();
        order.setOrderGoods(goods);
        order.setOrderBuyer(buyer);
        order.setOrderReceivingAccount(account);
        return orderMapper.insertSelective(order);
    }

    public List<OrderVO> getAllBuyOrdersVO(int buyer){
        List<Order> orders =orderMapper.getOrderByBuyer(buyer);
        return this.change(orders);
    }

    public List<OrderVO> getAllSellOrdersVO(int seller){
        List<Good> goods = goodMapper.selectBySeller(seller);
        List<Order> list = new ArrayList<>();
        for(Good good : goods){
            list.addAll(orderMapper.getOrderByGoodId(good.getGoodsId()));
        }
        return this.change(list);
    }

    private List<OrderVO> change(List<Order> list){
        List<OrderVO> orderVOS = new ArrayList<>();
        for(Order order : list){
            Good good = goodMapper.selectByPrimaryKey(order.getOrderGoods());
            OrderVO orderVO = new OrderVO();
            orderVO.setOrderId(order.getOrderId());
            orderVO.setGoodName(good.getGoodsName());
            orderVO.setOrderCreateTime(order.getOrderCreateTime());
            orderVO.setOrderUpdateTime(order.getOrderUpdateTime());
            orderVO.setOrderPrice(good.getGoodsPrice());
            orderVO.setOrderState(order.getOrderState());
            orderVOS.add(orderVO);
        }
        return orderVOS;
    }
}
