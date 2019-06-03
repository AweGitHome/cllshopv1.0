package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.User;
import cn.edu.lnsf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("register")
    @ResponseBody
    Map<String,Object> register(User user){
        Map<String,Object> map = new HashMap<>();
        int index = userService.userRegister(user);
        if(index!=0){
            map.put("msg","注册成功");
        }else{
            map.put("msg","注册失败");
        }
        return map;
    }

    @RequestMapping("login")
    String userlogin(User user, HttpSession session, HttpServletRequest request){
        User login = userService.login(user);
        if(login==null){
            request.setAttribute("msg","用户名或密码错误");
            return "forward:/login.jsp";
        }

        session.setAttribute("userInfo",user);
        return "redirect:/index.jsp";
    }

    @RequestMapping("check")
    @ResponseBody
    Map<String,Object> checkUser(User user){
        Map<String,Object> map = new HashMap<>();
        if(userService.checkUserIsExist(user)){
            map.put("msg","该用户已存在");
        }else{
            map.put("msg","可注册的用户");
        }
        return map;

    }
}
