package cn.edu.ncu.trading_server.service;

import cn.edu.ncu.trading_server.entity.Game;
import cn.edu.ncu.trading_server.mapper.GameMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GameService {
    @Autowired
    private GameMapper gameMapper;

    public List<Game> getHotGames(){
        return gameMapper.selectAll().subList(0,12);
    }

    public List<Game> getTypeOfGames(short gameType){
        List<Game> list = gameMapper.selectOfType(gameType);
        if(list == null || list.size() <= 12){
            return list;
        }else{
            return list.subList(0,12);
        }
    }
}
