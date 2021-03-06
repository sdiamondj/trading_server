package cn.edu.ncu.trading_server.controller;

import cn.edu.ncu.trading_server.entity.Game;
import cn.edu.ncu.trading_server.entity.Good;
import cn.edu.ncu.trading_server.entity.User;
import cn.edu.ncu.trading_server.service.GameService;
import cn.edu.ncu.trading_server.service.GoodService;
import cn.edu.ncu.trading_server.service.OrderService;
import cn.edu.ncu.trading_server.service.UserService;
import cn.edu.ncu.trading_server.vo.ApprovalVO;
import cn.edu.ncu.trading_server.vo.OrderVO;
import cn.edu.ncu.trading_server.vo.SellVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;


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

    @RequestMapping(value = "/sell.html")
    public String sell(HttpSession session,Model model){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }else{
            Integer userId = user.getUserId();
            List<SellVO> sellVOS = goodService.getSellVOS(userId);
            model.addAttribute("sellVOS",sellVOS);
            List<Game> games = gameService.getAll();
            model.addAttribute("games",games);
            return "sell";
        }
    }

    @RequestMapping(value = "/admin.html")
    public String goAdmin(HttpSession session,Model model){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }
        if(user.getUserIsAdmin() == 0){
            return "redirect:/index.html";
        }else{
            return "admin/admin";
        }
    }

    @RequestMapping(value = "/addGame.html")
    public String addGame(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }
        if(user.getUserIsAdmin() == 0){
            return "redirect:/index.html";
        }else{
            return "admin/addGame";
        }
    }

    @RequestMapping(value = "/approval.html")
    public String approvalGood(HttpSession session,Model model){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }
        if(user.getUserIsAdmin() == 0){
            return "redirect:/index.html";
        }else{
            List<ApprovalVO> approvalVOS = goodService.getApprovalVOList();
            model.addAttribute("approvalVOS",approvalVOS);
            return "admin/approval";
        }
    }

    @RequestMapping(value = "/admin-user.html")
    public String adminUser(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }
        if(user.getUserIsAdmin() == 0){
            return "redirect:/index.html";
        }else{
            return "admin/admin-user";
        }
    }

    @RequestMapping(value = "/admin-game.html")
    public String adminGame(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }
        if(user.getUserIsAdmin() == 0){
            return "redirect:/index.html";
        }else{
            return "admin/admin-game";
        }
    }

    @RequestMapping(value = "/admin-goods.html")
    public String adminGoods(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }
        if(user.getUserIsAdmin() == 0){
            return "redirect:/index.html";
        }else{
            return "admin/admin-goods";
        }
    }

    @RequestMapping(value = "/admin-order.html")
    public String adminOrder(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }
        if(user.getUserIsAdmin() == 0){
            return "redirect:/index.html";
        }else{
            return "admin/admin-order";
        }
    }

    @RequestMapping(value = "/admin-chart.html")
    public String adminChart(HttpSession session,Model model){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }
        if(user.getUserIsAdmin() == 0){
            return "redirect:/index.html";
        }else{
            Map<String,Integer> counts = userService.getCounts();
            model.addAllAttributes(counts);
            Map<String, BigDecimal> data = orderService.getData();
            model.addAllAttributes(data);
            Map<String, Object> array = orderService.getArray();
            model.addAllAttributes(array);
            return "admin/admin-chart";
        }
    }


}
