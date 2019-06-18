package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.Store;
import cn.edu.lnsf.entity.User;
import cn.edu.lnsf.service.StoreService;
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
    private StoreService storeService;

    @Autowired
    public void setStoreService(StoreService storeService) {
        this.storeService = storeService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    @RequestMapping("login")
    String login(User user, HttpSession session, HttpServletRequest request){
        User login = userService.login(user);
        if(login==null){
            request.setAttribute("msg","用户名或密码错误");
            return "forward:/adminLogin.jsp";
        }
        if(login.getRole()==0){
            session.setAttribute("userInfo",login);
            return "redirect:/admin/jsp/index.jsp";
        }
        if(login.getRole()==2){
            Store storeInfo = storeService.getByUid(login.getId());
            session.setAttribute("storeInfo",storeInfo);
            session.setAttribute("userInfo",login);
            return "redirect:/product/store_manage.html";
        }
        request.setAttribute("msg","请使用管理员账号登录");
        return "forward:/adminLogin.jsp";
    }

}
