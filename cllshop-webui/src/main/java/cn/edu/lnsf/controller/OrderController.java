package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.Order;
import cn.edu.lnsf.entity.OrdersProduct;
import cn.edu.lnsf.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    private OrderService orderService;

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @RequestMapping("orders.html")
    String getAllByUid(Integer uid, HttpServletRequest request){
        List<Order> orders = orderService.getAllOrdersByUid(uid);
        request.setAttribute("orders",orders);
        return "forward:/showorder.jsp";
    }

    @RequestMapping("orderDetails.html")
    String showDetails(Integer oid, HttpServletRequest request){
        List<OrdersProduct> orderDetails = orderService.getOrderDetailByOid(oid);
        request.setAttribute("orderDetails",orderDetails);
        Order order = orderService.getOrderByid(oid);
        request.setAttribute("order",order);
        return "forward:/showorderdetails.jsp";
    }

    @RequestMapping("returnorder.html")
    @ResponseBody
    Map<String, Object> returnOrderbyOid(Order order){
        Map<String, Object> map = new HashMap<>();
        int index = orderService.returnOrderbyOid(order);
        if (index != 0) {
            map.put("msg", "提交成功");
        } else {
            map.put("msg", "提交失败");
        }
        return map;
    }
}
