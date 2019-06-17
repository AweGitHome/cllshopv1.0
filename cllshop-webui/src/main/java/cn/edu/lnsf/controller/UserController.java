package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.User;
import cn.edu.lnsf.service.BigTypeService;
import cn.edu.lnsf.service.UserService;
import cn.edu.lnsf.util.CodeUtils;
import cn.edu.lnsf.util.MailUtils;
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
    private BigTypeService bigTypeService;

    @Autowired
    public void setBigTypeService(BigTypeService bigTypeService) {
        this.bigTypeService = bigTypeService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("register")
    @ResponseBody
    Map<String,Object> register(User user,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        int index = userService.userRegister(user);
        if(index!=0){
            request.getSession().removeAttribute("code");
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
        //List<BigType> bigTypes = bigTypeService.findAll();
        session.setAttribute("userInfo",login);
        //session.setAttribute("bigTypes",bigTypes);
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

    @ResponseBody
    @RequestMapping("checkEmail")
    Map<String,Object> checkEmail(User user,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        if(userService.checkEmailIsUsed(user)){
            map.put("msg","该邮箱已被注册");
            return map;
        }
        try {
            String code = CodeUtils.getCode();
            String content = "您的验证码为<span style='color:red;'>"+code+"</span>,请于30分钟内完成注册，感谢您的配合";
            MailUtils.sendMail(user.getEmail(),content);
            request.getSession().setAttribute("code",code);
            //session.setAttribute();
            map.put("msg","发送成功");
            return map;
        } catch (Exception e) {
            map.put("msg","发送失败");
            return map;
        }
    }

    @RequestMapping("checkCode")
    @ResponseBody
    Map<String,Object> checkCode(String code,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        String code1 = (String)request.getSession().getAttribute("code");
        if(code.equals(code1)){
            map.put("msg","验证成功");
        }else{
            map.put("msg","验证码错误");
        }
        return map;
    }

}
