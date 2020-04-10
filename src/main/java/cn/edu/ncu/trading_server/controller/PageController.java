package cn.edu.ncu.trading_server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String index(){
        return "index-test";
    }
}