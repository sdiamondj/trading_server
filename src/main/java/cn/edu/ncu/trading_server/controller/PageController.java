package cn.edu.ncu.trading_server.controller;

import cn.edu.ncu.trading_server.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class PageController {

    @RequestMapping(value = "/login.html")
    public String loginHtml(){
        return "login";
    }

    @RequestMapping(value = "/register.html")
    public String registerHtml(){
        return "register";
    }

    @RequestMapping(value = "/index.html")
    public String index(HttpSession session){
        User user = (User)session.getAttribute("user");
        if(user == null){
            return "redirect:/login.html";
        }else{
            return "index";
        }
    }
}
