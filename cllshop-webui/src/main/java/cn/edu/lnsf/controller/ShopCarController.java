package cn.edu.lnsf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("shopcar")
public class ShopCarController {

    @RequestMapping("getids")
    @ResponseBody
    void getIds(HttpServletRequest request,int id){
        HttpSession session = request.getSession();
        if(session.getAttribute("ids") != null) {
            String ids = (String)session.getAttribute("ids");
            ids = ids + "," + id;
            System.out.println(ids);
            session.setAttribute("ids",ids);
        }else {
            session.setAttribute("ids",id);
        }

    }

}
