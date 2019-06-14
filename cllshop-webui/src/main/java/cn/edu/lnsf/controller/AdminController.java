package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.User;
import cn.edu.lnsf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin1")
public class AdminController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping("login")
    String login(User user, HttpSession session, HttpServletRequest request){
        User login = userService.login(user);
        if(login==null){
            session.setAttribute("userInfo",user);
            request.setAttribute("msg","用户名或密码错误");
            return "forward:/adminLogin.jsp";
        }
        return "redirect:/admin/jsp/index.jsp";
    }

}
