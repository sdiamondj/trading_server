package cn.edu.ncu.trading_server.controller;

import cn.edu.ncu.trading_server.entity.Game;
import cn.edu.ncu.trading_server.entity.Good;
import cn.edu.ncu.trading_server.entity.User;
import cn.edu.ncu.trading_server.service.GameService;
import cn.edu.ncu.trading_server.service.GoodService;
import cn.edu.ncu.trading_server.service.OrderService;
import cn.edu.ncu.trading_server.service.UserService;
import cn.edu.ncu.trading_server.vo.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class PageController {

    @Autowired
    private GameService gameService;
    @Autowired
    private GoodService goodService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;


    @RequestMapping(value = "/login.html")
    public String loginHtml(){
        return "login";
    }

    @RequestMapping(value = "/register.html")
    public String registerHtml(){
        return "register";
    }

    @RequestMapping(value = "/404.html")
    public String error(){
        return "error/404";
    }

    @RequestMapping(value = "/index.html")
    public String index(HttpSession session, Model model){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }else{
            List<Game> hotGames = gameService.getHotGames();
            model.addAttribute("hot",hotGames);
            List<Game> clientGames = gameService.getTypeOfGames((short) 1);
            model.addAttribute("client",clientGames);
            List<Game> mobileGames = gameService.getTypeOfGames((short) 3);
            model.addAttribute("mobile",mobileGames);
            List<Game> pageGames = gameService.getTypeOfGames((short) 2);
            model.addAttribute("page",pageGames);
            List<Game> otherGames = gameService.getTypeOfGames((short) 4);
            model.addAttribute("other",otherGames);
            return "index";
        }
    }

    @RequestMapping(value = "/search.html")
    public String search(HttpSession session, Model model,
                         @RequestParam(required = false,defaultValue = "")String target){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }else{
            model.addAttribute("target",target);
            return "search";
        }
    }


    @RequestMapping(value = "/detail.html")
    public String detail(HttpSession session,Model model,
                         @RequestParam(value = "goodId",required = false,defaultValue = "-1")int goodId){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }else{
            if(goodId == -1){
                return "redirect:/index.html";
            }
            Good good = goodService.getGoodById(goodId);
            model.addAttribute("good",good);
            User seller = userService.getUserById(good.getGoodsSeller());
            model.addAttribute("seller",seller);
            String game = gameService.getGameById(good.getGoodsGame()).getGameName();
            model.addAttribute("game",game);
            return "detail";
        }
    }

    @RequestMapping(value = "/placeOrder.html")
    public String placeOrder(HttpSession session,Model model,
                             @RequestParam(value = "goodId",required = false,defaultValue = "-1")int goodId){
        User user = (User)session.getAttribute("user");
        if(user == null) {
            return "redirect:/login.html";
        }else{
            if(goodId == -1){
                return "redirect:/index.html";
            }
            Good good = goodService.getGoodById(goodId);
            model.addAttribute("good",good);
            String game = gameService.getGameById(good.getGoodsGame()).getGameName();
            model.addAttribute("game",game);
            return "placeOrder";
        }
    }

    @RequestMapping(value = "/order.html")
    public String order(HttpSession session,Model model){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }else{
            List<OrderVO> buyOrders = orderService.getAllBuyOrdersVO(user.getUserId());
            model.addAttribute("buyOrders",buyOrders);

            List<OrderVO> sellOrders = orderService.getAllSellOrdersVO(user.getUserId());
            model.addAttribute("sellOrders",sellOrders);

            return "order";
        }
    }

    @RequestMapping(value = "/self.html")
    public String self(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }else{
            return "self";
        }
    }



}
