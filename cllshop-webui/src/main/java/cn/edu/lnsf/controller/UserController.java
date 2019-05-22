package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.User;
import cn.edu.lnsf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/register")
    User register(User user){
        int index = userService.userRegister(user);
        return user;
    }

    @RequestMapping("/login")
    User login(User user){
        return userService.login(user);
    }
}
