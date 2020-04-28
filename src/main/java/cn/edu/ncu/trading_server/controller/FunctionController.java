package cn.edu.ncu.trading_server.controller;

import cn.edu.ncu.trading_server.dto.UserLoginDTO;
import cn.edu.ncu.trading_server.entity.Game;
import cn.edu.ncu.trading_server.entity.Good;
import cn.edu.ncu.trading_server.entity.Order;
import cn.edu.ncu.trading_server.entity.User;
import cn.edu.ncu.trading_server.service.GameService;
import cn.edu.ncu.trading_server.service.GoodService;
import cn.edu.ncu.trading_server.service.OrderService;
import cn.edu.ncu.trading_server.service.UserService;
import cn.edu.ncu.trading_server.vo.GoodVO;
import cn.edu.ncu.trading_server.vo.SearchGood;
import cn.edu.ncu.trading_server.vo.UploadFile;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.math.BigDecimal;
import java.util.*;

@Controller
public class FunctionController {

    @Autowired
    private GoodService goodService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private GameService gameService;

    @RequestMapping(value = "/user/login",method = RequestMethod.POST)
    public String userLogin(@RequestParam("userPhone")Long userPhone,
                            @RequestParam("password")String userPassword,
                            HttpSession session){
        UserLoginDTO userLoginDTO = new UserLoginDTO(userPhone,userPassword);
        User user = userService.userLogin(userLoginDTO);
        if(user == null){
            return "redirect:/login.html?error=true";
        }else{
            //session.invalidate();
            session.setAttribute("user",user);
            return "redirect:/index.html";
        }
    }

    @RequestMapping(value = "/user/register",method = RequestMethod.POST)
    public String userRegister(@RequestParam("userPhone")Long userPhone,
                               @RequestParam("password")String userPassword){
        UserLoginDTO userLoginDTO = new UserLoginDTO(userPhone,userPassword);
        int i = userService.userRegister(userLoginDTO);
        if(i == 0){
            return "redirect:/register.html?error=true";
        }else{
            return "redirect:/login.html";
        }
    }

    @RequestMapping(value = "/order/submit")
    public synchronized String submitOrder(HttpSession session,
                              @RequestParam("account")String account,
                              @RequestParam("goodId")int goodId){
        User user = (User)session.getAttribute("user");
        int count = orderService.checkOrder(goodId,user.getUserId());
        if(count > 0){
            return "redirect:/order.html";
        }
        int res = orderService.submitOrder(user.getUserId(),goodId,account);
        if(res == 1){
            Good good = goodService.getGoodById(goodId);
            if(good.getGoodsSeller().equals(user.getUserId())){
                return "redirect:/404.html";
            }
            if(good.getGoodsState() != 1){
                return "redirect:/404.html";
            }else{
                int i = goodService.changeState(goodId,(short) 3);
                if(i != 1){
                    return "redirect:/404.html";
                }else{
                    return "redirect:/order.html";
                }
            }
        }else{
            return "redirect:/404.html";
        }
    }

    @RequestMapping(value = "/user/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login.html";
    }

    @RequestMapping(value = "/getTable")
    @ResponseBody
    public String getTable(@RequestParam(required = false,defaultValue = "1")int page,
                           @RequestParam(required = false,defaultValue = "10")int limit,
                           @RequestParam(required = false,defaultValue = "")String target){
        List<SearchGood> list = goodService.getGoods(page,limit,target);
        int count = goodService.getCounts();
        GoodVO goodVO = new GoodVO(0,"无",count,list );
        return JSON.toJSONString(goodVO);
    }

    @RequestMapping(value = "/order/change",method = RequestMethod.POST)
    public String change(@RequestParam("orderId")int orderId,
                         @RequestParam("orderState")short orderState,
                         @RequestParam(value = "type",required = false,defaultValue = "1")int type){
        int i = orderService.changeState(orderId,orderState,type);
        if(i == 1){
            return "redirect:/order.html";
        }else{
            return "redirect:/404.html";
        }
    }

    @RequestMapping(value = "/updateUser",method = RequestMethod.POST)
    public String updateUser(HttpSession session,
            @RequestParam("nickname")String nickname,
            @RequestParam("password")String password,
            @RequestParam(value = "sex")byte sex,
                             @RequestParam(value = "url",required = false,defaultValue = "")String url){
        User oldUser = (User)session.getAttribute("user");
        userService.updateUser(oldUser,nickname,password,sex,url);
        session.removeAttribute("user");
        session.setAttribute("user",oldUser);
        return "redirect:/self.html";
    }

    @RequestMapping(value = "/upload")
    @ResponseBody
    public JSONObject upload(@RequestParam(value = "file")MultipartFile file){
        Map<String,Object> res = new HashMap<>();
        try {
            if(file != null){
                String name = System.currentTimeMillis()+file.getOriginalFilename() ;
                String filepath = System.getProperty("user.dir")+"\\src\\main\\resources\\static\\image\\";
                File newFile = new File(filepath+name);
                if(!newFile.exists()){
                    newFile.mkdirs();
                }
                file.transferTo(newFile);
                List<UploadFile> list = new ArrayList<>();
                UploadFile uploadFile = new UploadFile();
                uploadFile.setSrc(name);
                list.add(uploadFile);
                res.put("data",list);
                res.put("code",0);
                res.put("msg","上传成功");
            }
        }catch (Exception e){
            res.put("code",-1);
            res.put("msg","上传失败");
        }
        return  new JSONObject(res);
    }

    @RequestMapping(value = "/goods/update",method = RequestMethod.POST)
    public String updateGoods(@RequestParam("goodId")Integer goodId,
                              @RequestParam("goodName")String goodName,
                              @RequestParam("goodGame")Integer goodGame,
                              @RequestParam("gameServer")String gameServer,
                              @RequestParam("goodPrice")BigDecimal goodPrice,
                              @RequestParam("goodPicture")String goodPicture,
                              @RequestParam(value = "goodDescription",required = false,
                                      defaultValue = "")String goodDescription,
                              HttpSession session){
        User user = (User)session.getAttribute("user");
        Good good = new Good();
        good.setGoodsId(goodId);
        good.setGoodsName(goodName);
        good.setGoodsGame(goodGame);
        good.setGoodsGameServer(gameServer);
        good.setGoodsPrice(goodPrice);
        good.setGoodsPicture(goodPicture);
        good.setGoodsDescription(goodDescription);
        good.setGoodsState((short)0);
        good.setGoodsSeller(user.getUserId());
        int i = goodService.updateGood(good);
        if( i == 1 ){
            return "redirect:/sell.html";
        }else{
            return "redirect:/404.html";
        }
    }

    @RequestMapping(value = "/goods/state",method = RequestMethod.POST)
    public String goodState(@RequestParam("goodId")int goodId,
                            @RequestParam("goodState")short goodState){
        if(goodState == 1){
            goodState = 2;
        }else{
            goodState = 1;
        }
        int i = goodService.changeState(goodId,goodState);
        if( i == 1 ){
            return "redirect:/sell.html";
        }else{
            return "redirect:/404.html";
        }
    }

    @RequestMapping(value = "/goods/delete",method = RequestMethod.POST)
    public String deleteGoods(@RequestParam("goodId")int goodId){
        int i = goodService.deleteGood(goodId);
        if( i == 1){
            return "redirect:/sell.html";
        }else{
            return "redirect:/404.html";
        }
    }

    @RequestMapping(value = "/goods/add",method = RequestMethod.POST)
    public String addGoods(@RequestParam("goodName")String goodName,
                           @RequestParam("goodGame")int goodGame,
                           @RequestParam("gameServer")String gameServer,
                           @RequestParam("goodPrice")BigDecimal goodPrice,
                           @RequestParam("goodPicture")String goodPicture,
                           @RequestParam("goodDescription")String goodDescription,
                           HttpSession session){
        Good good = new Good();
        good.setGoodsName(goodName);
        good.setGoodsGame(goodGame);
        good.setGoodsGameServer(gameServer);
        good.setGoodsPrice(goodPrice);
        good.setGoodsPicture(goodPicture);
        good.setGoodsDescription(goodDescription);
        User user = (User)session.getAttribute("user");
        good.setGoodsSeller(user.getUserId());
        int i = goodService.addGood(good);
        if( i == 1){
            return "redirect:/sell.html";
        }else{
            return "redirect:/404.html";
        }
    }

    @RequestMapping(value = "/admin/addGame",method = RequestMethod.POST)
    public String addGame(@RequestParam("gameName")String gameName,
                          @RequestParam("gameType")short gameType,
                          @RequestParam("gameLogo")String gameLogo){
        Game game = new Game();
        game.setGameName(gameName);
        game.setGamePicture(gameLogo);
        game.setGameType(gameType);
        int i = gameService.addGame(game);
        if(i == 1){
            return "redirect:/addGame.html";
        }else{
            return "redirect:/404.html";
        }
    }

    @RequestMapping(value = "/admin/approval")
    public String approval(@RequestParam("goodId")int goodId,
                           @RequestParam("goodState")short goodState){
        int i = goodService.changeState(goodId, goodState);
        if( i == 1){
            return "redirect:/approval.html";
        }else{
            return "redirect:/404.html";
        }
    }

    @RequestMapping(value = "/admin/getUser")
    @ResponseBody
    public Map<String,Object> adminGetUser(@RequestParam(required = false,defaultValue = "1")int page,
                                           @RequestParam(required = false,defaultValue = "10")int limit,
                                           HttpSession session){
        Map<String,Object> map = new HashMap<>();
        User user = (User)session.getAttribute("user");
        if(user == null || user.getUserIsAdmin() == 0){
            map.put("code",-1);
            map.put("msg","没有权限!");
        }else{
            int count = userService.getUserCount();
            List<User> list = userService.getUserList(page,limit);
            map.put("count",count);
            map.put("data",list);
            map.put("code",0);
            map.put("msg","success");
        }
        return map;
    }

    @RequestMapping("/user/admin")
    public String addAdmin(@RequestParam("userId")Integer userId){
        User user = new User();
        user.setUserId(userId);
        user.setUserIsAdmin(1);
        int i = userService.addAdmin(user);
        if(i == 1){
            return "redirect:/admin-user.html";
        }else{
            return "redirect:/404.html";
        }
    }

    @RequestMapping("/user/delete")
    public String deleteUser(@RequestParam("userId")Integer userId){
        int i = userService.deleteUser(userId);
        if(i == 1){
            return "redirect:/admin-user.html";
        }else{
            return "redirect:/404.html";
        }
    }

    @RequestMapping(value = "/admin/getGame")
    @ResponseBody
    public Map<String,Object> adminGetGame(@RequestParam(required = false,defaultValue = "1")int page,
                                           @RequestParam(required = false,defaultValue = "10")int limit,
                                           HttpSession session){
        Map<String,Object> map = new HashMap<>();
        User user = (User)session.getAttribute("user");
        if(user == null || user.getUserIsAdmin() == 0){
            map.put("code",-1);
            map.put("msg","没有权限!");
        }else{
            int count = gameService.getGameCount();
            List<Game> list = gameService.getGameList(page,limit);
            map.put("count",count);
            map.put("data",list);
            map.put("code",0);
            map.put("msg","success");
        }
        return map;
    }

    @RequestMapping("/game/delete")
    public String deleteGame(@RequestParam("gameId")Integer gameId){
        int i = gameService.deleteGame(gameId);
        if(i == 1){
            return "redirect:/admin-game.html";
        }else{
            return "redirect:/404.html";
        }
    }

    @RequestMapping(value = "/admin/getGoods")
    @ResponseBody
    public Map<String,Object> adminGetGoods(@RequestParam(required = false,defaultValue = "1")int page,
                                           @RequestParam(required = false,defaultValue = "10")int limit,
                                           HttpSession session){
        Map<String,Object> map = new HashMap<>();
        User user = (User)session.getAttribute("user");
        if(user == null || user.getUserIsAdmin() == 0){
            map.put("code",-1);
            map.put("msg","没有权限!");
        }else{
            int count = goodService.getGoodCount();
            List<Good> list = goodService.getGoodList(page,limit);
            map.put("count",count);
            map.put("data",list);
            map.put("code",0);
            map.put("msg","success");
        }
        return map;
    }

    @RequestMapping(value = "/admin/getOrder")
    @ResponseBody
    public Map<String,Object> adminGetOrder(@RequestParam(required = false,defaultValue = "1")int page,
                                            @RequestParam(required = false,defaultValue = "10")int limit,
                                            HttpSession session){
        Map<String,Object> map = new HashMap<>();
        User user = (User)session.getAttribute("user");
        if(user == null || user.getUserIsAdmin() == 0){
            map.put("code",-1);
            map.put("msg","没有权限!");
        }else{
            int count = orderService.getOrderCount();
            List<Order> list = orderService.getOrderList(page,limit);
            map.put("count",count);
            map.put("data",list);
            map.put("code",0);
            map.put("msg","success");
        }
        return map;
    }


}
