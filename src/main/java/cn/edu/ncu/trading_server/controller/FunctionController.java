package cn.edu.ncu.trading_server.controller;

import cn.edu.ncu.trading_server.dto.UserLoginDTO;
import cn.edu.ncu.trading_server.entity.Good;
import cn.edu.ncu.trading_server.entity.User;
import cn.edu.ncu.trading_server.service.GameService;
import cn.edu.ncu.trading_server.service.GoodService;
import cn.edu.ncu.trading_server.service.OrderService;
import cn.edu.ncu.trading_server.service.UserService;
import cn.edu.ncu.trading_server.vo.GoodVO;
import cn.edu.ncu.trading_server.vo.SearchGood;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class FunctionController {

    @Autowired
    private GoodService goodService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/user/login",method = RequestMethod.POST)
    public String userLogin(@RequestParam("userPhone")Long userPhone,
                            @RequestParam("password")String userPassword,
                            HttpSession session){
        UserLoginDTO userLoginDTO = new UserLoginDTO(userPhone,userPassword);
        User user = userService.userLogin(userLoginDTO);
        if(user == null){
            return "redirect:/login.html?error=true";
        }else{
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
    public String submitOrder(HttpSession session,
                              @RequestParam("account")String account,
                              @RequestParam("goodId")int goodId){
        User user = (User)session.getAttribute("user");
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
}
