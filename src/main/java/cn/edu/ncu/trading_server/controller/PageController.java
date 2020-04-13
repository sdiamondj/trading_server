package cn.edu.ncu.trading_server.controller;

import cn.edu.ncu.trading_server.entity.Game;
import cn.edu.ncu.trading_server.entity.User;
import cn.edu.ncu.trading_server.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class PageController {

    @Autowired
    private GameService gameService;

    @RequestMapping(value = "/login.html")
    public String loginHtml(){
        return "login";
    }

    @RequestMapping(value = "/register.html")
    public String registerHtml(){
        return "register";
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
}
