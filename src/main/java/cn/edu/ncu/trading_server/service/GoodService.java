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

    private int counts;

    public int getCounts(){
        return counts;
    }

    public List<SearchGood> getGoods(int page,int limit,String target){
        List<Good> list = new ArrayList<>();
        if(target == null || target.equals("")){
            list = goodMapper.selectAllCanBuy();
        }else{
            List<Game> games = gameMapper.selectByTarget(target);
            for(Game game : games){
                List<Good> goods = goodMapper.selectByGame(game.getGameId());
                list.addAll(goods);
            }
            List<Good> goodList = goodMapper.selectByTarget(target);
            list.addAll(goodList);
        }
        counts = list.size();
        List<SearchGood> myList = new ArrayList<>();
        for(int i = (page-1)*10,j=0;j<limit && i<list.size();i++,j++){
            SearchGood searchGood = new SearchGood();
            searchGood.setGoodsId(list.get(i).getGoodsId());
            searchGood.setGoodsName(list.get(i).getGoodsName());
            Game game = gameMapper.selectByPrimaryKey(list.get(i).getGoodsGame());
            searchGood.setGoodsGame(game.getGameName());
            searchGood.setGoodsServer(list.get(i).getGoodsGameServer());
            User seller = userMapper.selectByPrimaryKey(list.get(i).getGoodsSeller());
            searchGood.setGoodsSeller(seller.getUserNickname());
            searchGood.setGoodsUpdateTime(list.get(i).getGoodsUpdateTime());
            searchGood.setGoodsPrice(list.get(i).getGoodsPrice());
            myList.add(searchGood);
        }
        return myList;
    }

    public Good getGoodById(int goodId){
        return goodMapper.selectByPrimaryKey(goodId);
    }



}
