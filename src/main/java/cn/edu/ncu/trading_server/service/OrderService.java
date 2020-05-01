package cn.edu.ncu.trading_server.service;

import cn.edu.ncu.trading_server.entity.Game;
import cn.edu.ncu.trading_server.entity.Good;
import cn.edu.ncu.trading_server.entity.Order;
import cn.edu.ncu.trading_server.mapper.GameMapper;
import cn.edu.ncu.trading_server.mapper.GoodMapper;
import cn.edu.ncu.trading_server.mapper.OrderMapper;
import cn.edu.ncu.trading_server.vo.OrderVO;
import com.sun.tools.corba.se.idl.constExpr.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public Map<String, BigDecimal> getData(){
        Map<String,BigDecimal> map = new HashMap<>();
        List<Order> orders = orderMapper.selectByState((short)4);
        BigDecimal total = new BigDecimal(0);
        for(Order order : orders){
            Good good = goodMapper.selectByPrimaryKey(order.getOrderGoods());
            total = total.add(good.getGoodsPrice());
        }
        map.put("total",total);
        BigDecimal percent,in;
        if(!total.equals(new BigDecimal(0))){
            in = total.multiply(new BigDecimal(0.05)).setScale(2,BigDecimal.ROUND_HALF_UP);
            percent = in.divide(new BigDecimal(100000000),6,BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(100));
        }else{
            percent = new BigDecimal(0);
            in = new BigDecimal(0);
        }
        map.put("in",in);
        map.put("percent",percent);
        return map;
    }

    public Map<String,Object> getArray(){
        Map<String,Object> map = new HashMap<>();
        LocalDate date = LocalDate.now();
        map.put("date0",date.toString());
        map.put("date1",date.plusDays(-1).toString());
        map.put("date2",date.plusDays(-2).toString());
        map.put("date3",date.plusDays(-3).toString());
        map.put("date4",date.plusDays(-4).toString());
        map.put("date5",date.plusDays(-5).toString());
        map.put("date6",date.plusDays(-6).toString());
        map.put("date7",date.plusDays(-7).toString());
        map.put("date8",date.plusDays(-8).toString());
        map.put("date9",date.plusDays(-9).toString());
        map.put("date10",date.plusDays(-10).toString());
        map.put("date11",date.plusDays(-11).toString());
        map.put("date12",date.plusDays(-12).toString());
        map.put("date13",date.plusDays(-13).toString());
        for(int i = 0; i > -14; i--){
            LocalDate cur = date.plusDays(i);
            List<Order> list = orderMapper.selectByDate(cur.toString());
            int count = 0;
            BigDecimal money = new BigDecimal(0);
            for(Order order : list){
                if(order.getOrderState() == 4){
                    count++;
                    Good good = goodMapper.selectByPrimaryKey(order.getOrderGoods());
                    money = money.add(good.getGoodsPrice());
                }
            }
            map.put("count"+(i*-1),count);
            map.put("money"+(i*-1),money.setScale(2,BigDecimal.ROUND_HALF_UP));
        }
        return map;
    }
}
