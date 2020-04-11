package cn.edu.ncu.trading_server.controller;

import cn.edu.ncu.trading_server.dto.UserLoginDTO;
import cn.edu.ncu.trading_server.entity.User;
import cn.edu.ncu.trading_server.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
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

    @RequestMapping(value = "/register",method = RequestMethod.POST)
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

}
