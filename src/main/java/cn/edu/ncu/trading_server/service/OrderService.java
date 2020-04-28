package cn.edu.ncu.trading_server.service;

import cn.edu.ncu.trading_server.entity.Game;
import cn.edu.ncu.trading_server.entity.Good;
import cn.edu.ncu.trading_server.entity.Order;
import cn.edu.ncu.trading_server.mapper.GameMapper;
import cn.edu.ncu.trading_server.mapper.GoodMapper;
import cn.edu.ncu.trading_server.mapper.OrderMapper;
import cn.edu.ncu.trading_server.vo.OrderVO;
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
    @Autowired
    private GameMapper gameMapper;

    public int submitOrder(int buyer,int goods,String account){
        Order order =new Order();
        order.setOrderGoods(goods);
        order.setOrderBuyer(buyer);
        order.setOrderReceivingAccount(account);
        return orderMapper.insertSelective(order);
    }

    public int checkOrder(int goodId,int userId){
        return orderMapper.selectCountIsSubmit(goodId,userId);
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
            orderVO.setAccount(order.getOrderReceivingAccount());
            Game game = gameMapper.selectByPrimaryKey(good.getGoodsGame());
            orderVO.setGame(game.getGameName());
            orderVO.setServer(good.getGoodsGameServer());
            orderVOS.add(orderVO);
        }
        return orderVOS;
    }

    public int changeState(int orderId,short orderState,int type){
        Order order = new Order();
        short i;
        if(orderState == 0 ||  orderState == 5){
            i = 5;
        }else if(orderState == 1){
            if(type == 0){
                i = 5;
            }else{
                i = 2;
            }
        } else  {
            i = (short)(orderState+1);
        }
        order.setOrderState(i);
        order.setOrderId(orderId);
        if(i == 5){
            Order oldOrder = orderMapper.selectByPrimaryKey(orderId);
            int goodId = oldOrder.getOrderGoods();
            Good good = new Good();
            good.setGoodsId(goodId);
            good.setGoodsState((short)1);
            goodMapper.updateByPrimaryKeySelective(good);
        }
        return orderMapper.updateByPrimaryKeySelective(order);
    }

    public int getOrderCount(){
        return orderMapper.selectAll().size();
    }

    public List<Order> getOrderList(int page,int limit){
        List<Order> list = orderMapper.selectAll();
        return UserService.listUtil(list,page,limit);
    }
}
