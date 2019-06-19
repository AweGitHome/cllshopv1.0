package cn.edu.lnsf.controller;

import cn.edu.lnsf.entity.*;
import cn.edu.lnsf.service.OrderService;
import cn.edu.lnsf.service.ProductsService;
import cn.edu.lnsf.service.StoreService;
import cn.edu.lnsf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("store")
public class StoreController {

    private StoreService storeService;
    private UserService userService;
    private OrderService orderService;
    private ProductsService productsService;

    @Autowired
    public void setStoreService(StoreService storeService) {
        this.storeService = storeService;
    }

    @Autowired
    public void setUserService(UserService userService) { this.userService = userService; }

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @Autowired
    public void setProductsService(ProductsService productsService) {
        this.productsService = productsService;
    }

    @RequestMapping("register")
    @ResponseBody
    Map<String, Object> register(Store store) {
        Map<String, Object> map = new HashMap<>();
        int index = storeService.storeRegister(store);
        User user = new User();
        user.setId(store.getUserid());
        user.setRole(2);
        userService.updateUser(user);
        if (index != 0) {
            map.put("msg", "入驻申请提交成功");
        } else {
            map.put("msg", "入驻申请提交失败");
        }
        return map;
    }

    @RequestMapping("check")
    @ResponseBody
    Map<String, Object> checkStore(Store store) {
        Map<String, Object> map = new HashMap<>();
        if (storeService.checkStoreIsExist(store)) {
            map.put("msg", "该店铺名已被注册");
        } else {
            map.put("msg", "该店铺名可使用");
        }
        return map;

    }

    @RequestMapping("showStoreList")
    public String showProductsList(int curPage, HttpServletRequest request) {
        PageBean pageInfo = storeService.getPageData(curPage);
        request.setAttribute("pageInfo", pageInfo);
        return "forward:/store.jsp";
    }

    @RequestMapping("showAudstoreList")
    public String showAudList(String curPage, HttpServletRequest request) {
        if (curPage == null) {
            curPage = "1";
        }
        int curpage = Integer.parseInt(curPage);
        PageBean pageInfo = storeService.getAudPageData(curpage);
        request.setAttribute("pageInfo", pageInfo);
        return "forward:/admin/jsp/auditing.jsp";
    }

    @RequestMapping("showOrders.html")
    public String showOrdList(/*String curPage,*/ HttpServletRequest request) {
        Store store = (Store) request.getSession().getAttribute("storeInfo");
        if (store == null){
            return null;
        }
        List<Order> orders = storeService.getOrdByStoreid(store.getId());
        request.setAttribute("orders",orders);
        return "forward:/admin/jsp/storeshoworder.jsp";
    }



    @RequestMapping("passRegister")
    @ResponseBody
    Map<String, Object> passRegister(Store store) {
        Map<String, Object> map = new HashMap<>();
        map.put("msg", "提交失败");
        if (storeService.passStoreRegi(store) != 0) {
            map.put("msg", "提交成功");
        }
        return map;
    }

    @RequestMapping("showStore")
    String showStore(HttpServletRequest request) {
        List<Store> stores = storeService.getRegStore();
        request.setAttribute("stores", stores);
        return "forward:/store.jsp";
    }

    @RequestMapping("changeOrderStatus")
    @ResponseBody
    public void changeOrderStatus(Order order){
        List<OrdersProduct> ordersProducts = orderService.getOrderDetailByOid(order.getId());
        for(OrdersProduct ordersProduct:ordersProducts){
            Product product = ordersProduct.getProduct();
            product.setStock(product.getStock()+ordersProduct.getNum());
            productsService.updateProduct(product);
        }
        orderService.updateByOid(order);
    }
}

