package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.Product;
import cn.edu.lnsf.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ShopCarController {

    private ProductsService productsService;

    @Autowired
    public void setProductsService(ProductsService productsService) {
        this.productsService = productsService;
    }

    @RequestMapping("cart.html")
    String goCartPage(HttpServletRequest request){
        List<Integer> ids = new ArrayList<>();
        int id;
        Cookie[] cookies = request.getCookies();
        if (null==cookies) {//如果没有cookie数组
            System.out.println("没有cookie");
        } else {
            for(Cookie cookie : cookies){
                System.out.println(cookie.getName());
                System.out.println(cookie.getName().indexOf("id"));
                if(cookie.getName().indexOf("id")!=0||"JSESSIONID".equals(cookie.getName())){
                    continue;
                }
                System.out.println(cookie.getValue());
                id = Integer.parseInt(cookie.getValue());
                ids.add(id);
            }
        }
        List<Product> prod = productsService.getProdByIds(ids);
        request.setAttribute("order_products",prod);
        return "forward:/checkout.jsp";
    }



}
