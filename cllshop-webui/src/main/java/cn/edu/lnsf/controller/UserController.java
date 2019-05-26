package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.PageBean;
import cn.edu.lnsf.entity.User;
import cn.edu.lnsf.service.ProductsService;
import cn.edu.lnsf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    private UserService userService;
    private ProductsService productsService;
    @Autowired
    public void setProductsService(ProductsService productsService) {
        this.productsService = productsService;
    }

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
    @RequestMapping("/test")
    PageBean test(int curPage){
        return productsService.getPageData(curPage);
    }
}
