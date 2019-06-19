package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.User;
import cn.edu.lnsf.service.UserService;
import cn.edu.lnsf.util.CodeUtils;
import cn.edu.lnsf.util.MailUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    @RequestMapping("checkpassword")
    @ResponseBody
    Map<String,Object> checkPassword(User user){
        Map<String,Object> map = new HashMap<>();
        if(userService.checkPasswordIsRight(user)){
            map.put("msg","原密码正确!");
        }else{
            map.put("msg","原密码错误!");
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

    @ResponseBody
    @RequestMapping("checkEmail1")
    Map<String,Object> checkEmail1(User user,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        if(userService.checkEmailIsUsed(user)){
            map.put("msg","该邮箱已注册！");
            try {
                String code = CodeUtils.getCode();
                String content = "您的验证码为<span style='color:red;'>"+code+"</span>,请于30分钟内完成验证，感谢您的配合";
                MailUtils.sendMail(user.getEmail(),content);
                request.getSession().setAttribute("code",code);
                //session.setAttribute();
                map.put("msg","发送成功");
                return map;
            } catch (Exception e) {
                map.put("msg","发送失败");
                return map;
            }

        }else {
            map.put("msg","该邮箱与账号注册邮箱不符！");
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

    @RequestMapping("showinfo")
    public String showInfo(String userName,HttpServletRequest request){
        User user = userService.getUserByUsername(userName);
        request.setAttribute("user",user);
        return "forward:/userinformation.jsp";
    }

    @RequestMapping("upadateinfo")
    @ResponseBody
    Map<String,Object> updateInfo(User user,String birthday_,HttpServletRequest request){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Map<String,Object> map = new HashMap<>();
        try {
            Date birthday = simpleDateFormat.parse(birthday_);
            map.put("msg","更新失败");
            user.setBirthday(birthday);
            user.setInfocomplete(1);
            if(userService.updateUser(user)!=0){
                map.put("msg","更新成功");
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("showinfo2")
    public String showInfo(int userId,HttpServletRequest request){
        User user = userService.getUserById(userId);
        request.setAttribute("user",user);
        return "forward:/updateinfo.jsp";
    }

    @RequestMapping("updatepassword")
    @ResponseBody
    Map<String,Object> updatepassword(User user,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        int index = userService.updateUser(user);
        if(index!=0){
            request.getSession().removeAttribute("userInfo");
            map.put("msg","修改成功");

        }else{
            map.put("msg","修改失败");
        }
        return map;
    }

    @RequestMapping("exit")
    @ResponseBody
    public void userExit(HttpServletRequest request){
        request.getSession().removeAttribute("userInfo");
    }

}
