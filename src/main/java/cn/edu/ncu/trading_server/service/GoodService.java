package cn.edu.ncu.trading_server.service;

import cn.edu.ncu.trading_server.entity.Game;
import cn.edu.ncu.trading_server.entity.Good;
import cn.edu.ncu.trading_server.entity.User;
import cn.edu.ncu.trading_server.mapper.GameMapper;
import cn.edu.ncu.trading_server.mapper.GoodMapper;
import cn.edu.ncu.trading_server.mapper.UserMapper;
import cn.edu.ncu.trading_server.vo.ApprovalVO;
import cn.edu.ncu.trading_server.vo.SearchGood;
import cn.edu.ncu.trading_server.vo.SellVO;
import com.sun.org.apache.regexp.internal.RE;
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

    public int changeState(int goodId,short state){
        Good good = new Good();
        good.setGoodsId(goodId);
        good.setGoodsState(state);
        return goodMapper.updateByPrimaryKeySelective(good);
    }

    public List<SellVO> getSellVOS(int userId){
        List<SellVO> list = new ArrayList<>();
        List<Good> goods = goodMapper.selectBySeller(userId);
        for(Good good : goods){
            if(good.getGoodsState()!=3 && good.getGoodsState() != 4){
                SellVO sellVO = new SellVO();
                sellVO.setGoodId(good.getGoodsId());
                sellVO.setGoodName(good.getGoodsName());
                Game game = gameMapper.selectByPrimaryKey(good.getGoodsGame());
                sellVO.setGoodGame(game.getGameName());
                sellVO.setGameServer(good.getGoodsGameServer());
                sellVO.setGoodPrice(good.getGoodsPrice());
                sellVO.setGoodPicture(good.getGoodsPicture());
                sellVO.setGoodDescription(good.getGoodsDescription());
                sellVO.setGoodState(good.getGoodsState());
                list.add(sellVO);
            }
        }
        return list;
    }

    public Integer updateGood(Good good){
        return goodMapper.updateByPrimaryKeySelective(good);
    }

    public Integer deleteGood(int goodId){
        return goodMapper.deleteByPrimaryKey(goodId);
    }

    public Integer addGood(Good good){
        return goodMapper.insertSelective(good);
    }

    public List<ApprovalVO> getApprovalVOList(){
        List<ApprovalVO> list = new ArrayList<>();
        List<Good> goods = goodMapper.selectByState(0);
        for(Good good : goods){
            ApprovalVO approvalVO = new ApprovalVO();
            approvalVO.setGoodId(good.getGoodsId());
            approvalVO.setGoodName(good.getGoodsName());
            Game game = gameMapper.selectByPrimaryKey(good.getGoodsGame());
            approvalVO.setGoodGame(game.getGameName());
            approvalVO.setGameServer(good.getGoodsGameServer());
            approvalVO.setGoodPicture(good.getGoodsPicture());
            approvalVO.setGoodPrice(good.getGoodsPrice());
            User seller = userMapper.selectByPrimaryKey(good.getGoodsSeller());
            approvalVO.setGoodSeller(seller.getUserPhone());
            list.add(approvalVO);
        }
        return list;
    }


}
