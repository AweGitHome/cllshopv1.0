package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.BigType;
import cn.edu.lnsf.service.BigTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
@Controller
public class IndexController {
    private BigTypeService bigTypeService;

    @Autowired
    public void setBigTypeService(BigTypeService bigTypeService) {
        this.bigTypeService = bigTypeService;
    }

    @RequestMapping("/")
    String index(HttpServletRequest request){
        HttpSession session = request.getSession();
        List<BigType> bigTypes = bigTypeService.findAll();
        if(session.getAttribute("bigTypes")==null)
        session.setAttribute("bigTypes",bigTypes);
        return "redirect:/index.jsp";
    }
}
