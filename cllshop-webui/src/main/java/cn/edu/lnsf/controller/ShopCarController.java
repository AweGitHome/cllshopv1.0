package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.Order;
import cn.edu.lnsf.entity.OrdersProduct;
import cn.edu.lnsf.entity.Product;
import cn.edu.lnsf.entity.User;
import cn.edu.lnsf.service.OrderService;
import cn.edu.lnsf.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ShopCarController {

    private ProductsService productsService;
    private OrderService orderService;

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

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
                if(cookie.getName().indexOf("id")!=0||"JSESSIONID".equals(cookie.getName())){
                    continue;
                }
                System.out.println(cookie.getValue());
                id = Integer.parseInt(cookie.getValue());
                ids.add(id);
            }
        }
        if(ids.size()==0){
            return "forward:/checkout.jsp";
        }
        List<Product> prod = productsService.getProdByIds(ids);
        request.setAttribute("order_products",prod);
        return "forward:/checkout.jsp";
    }

    @RequestMapping(value = "/submitOrder", produces = "application/json;charset=UTF-8")
    @ResponseBody
    Map<String, Object> createOrder(@RequestBody List<OrdersProduct> ordersProducts, HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        User user = (User)request.getSession().getAttribute("userInfo");
        map.put("status",500);
        if(orderService.createOrder(new Order(),ordersProducts,user.getId())!=0){
            map.put("status",200);
        }
        return map;
    }

}
