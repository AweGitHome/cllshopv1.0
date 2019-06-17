package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.BigType;
import cn.edu.lnsf.entity.Product;
import cn.edu.lnsf.service.BigTypeService;
import cn.edu.lnsf.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
@Controller
public class IndexController {
    private BigTypeService bigTypeService;
    private ProductsService productsService;
    @Autowired
    public void setBigTypeService(BigTypeService bigTypeService) {
        this.bigTypeService = bigTypeService;
    }

    @Autowired
    public void setProductsService(ProductsService productsService) {
        this.productsService = productsService;
    }

    @RequestMapping("/")
    String index(HttpServletRequest request){
        HttpSession session = request.getSession();
        List<BigType> bigTypes = bigTypeService.findAll();
        List<Product> hotList = productsService.getHotProduct();
        List<Product> lastProduct = productsService.getLastProduct();
        if(session.getAttribute("bigTypes")==null)
        session.setAttribute("bigTypes",bigTypes);
        session.setAttribute("hotList",hotList);
        session.setAttribute("newList",lastProduct);
        return "redirect:/index.jsp";
    }
}
