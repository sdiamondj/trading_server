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

    public Game getGameById(int id){
        return gameMapper.selectByPrimaryKey(id);
    }

    public List<Game> getAll(){
        return gameMapper.selectAll();
    }

    public List<Game> getHotGames(){
        List<Game> list = gameMapper.selectAll();
        if(list == null || list.size() <= 12){
            return list;
        }else{
            return list.subList(0,12);
        }
    }

    public List<Game> getTypeOfGames(short gameType){
        List<Game> list = gameMapper.selectOfType(gameType);
        if(list == null || list.size() <= 12){
            return list;
        }else{
            return list.subList(0,12);
        }
    }

    public int addGame(Game game){
        return gameMapper.insertSelective(game);
    }

    public int getGameCount(){
        return gameMapper.selectAll().size();
    }

    public List<Game> getGameList(int page,int limit){
        List<Game> list = gameMapper.selectAll();
        return UserService.listUtil(list,page,limit);
    }

    public int deleteGame(int gameId){
        return gameMapper.deleteByPrimaryKey(gameId);
    }
}
