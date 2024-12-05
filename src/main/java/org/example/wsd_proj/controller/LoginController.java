package org.example.wsd_proj.controller;

import org.example.wsd_proj.Service.UserService;
import org.example.wsd_proj.VO.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/login", method= RequestMethod.GET)
    public String login() {
        return "login";
    }
    @RequestMapping(value = "/error", method= RequestMethod.GET)
    public String error() {
        return "error";
    }

    @RequestMapping(value = "/loginOk", method = RequestMethod.POST)
    public String loginCheck(HttpSession session, UserVO uservo){
        String reutrnURL = "";
        if(session.getAttribute("login") != null){
            session.removeAttribute("login");
        }

        UserVO loginvo = userService.getUser(uservo);
        if(loginvo != null){
            System.out.println("login success");
            session.setAttribute("login", loginvo);
            reutrnURL = "redirect:/crud/list";
        }
        else{
            System.out.println("login falied");
            reutrnURL = "redirect:/login/error";
        }
        return reutrnURL;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/login/login";
    }
}
