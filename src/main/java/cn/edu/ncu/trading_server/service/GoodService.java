package cn.edu.ncu.trading_server.service;

import cn.edu.ncu.trading_server.entity.Game;
import cn.edu.ncu.trading_server.entity.Good;
import cn.edu.ncu.trading_server.entity.User;
import cn.edu.ncu.trading_server.mapper.GameMapper;
import cn.edu.ncu.trading_server.mapper.GoodMapper;
import cn.edu.ncu.trading_server.mapper.UserMapper;
import cn.edu.ncu.trading_server.vo.SearchGood;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class GoodService {

    @Autowired
    private GoodMapper goodMapper;
    @Autowired
    private GameMapper gameMapper;
    @Autowired
    private UserMapper userMapper;

    public List<SearchGood> getGoods(){
        List<Good> list = goodMapper.selectAll();
        List<SearchGood> myList = new ArrayList<>();
        for(Good good : list){
            SearchGood searchGood = new SearchGood();
            searchGood.setGoodsId(good.getGoodsId());
            searchGood.setGoodsName(good.getGoodsName());
            Game game = gameMapper.selectByPrimaryKey(good.getGoodsGame());
            searchGood.setGoodsGame(game.getGameName());
            searchGood.setGoodsServer(good.getGoodsGameServer());
            User seller = userMapper.selectByPrimaryKey(good.getGoodsSeller());
            searchGood.setGoodsSeller(seller.getUserNickname());
            searchGood.setGoodsUpdateTime(good.getGoodsUpdateTime());
            searchGood.setGoodsPrice(good.getGoodsPrice());
            myList.add(searchGood);
        }
        return myList;
    }



}
