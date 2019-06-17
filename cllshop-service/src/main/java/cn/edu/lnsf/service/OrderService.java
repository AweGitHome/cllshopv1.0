package cn.edu.lnsf.service;

import cn.edu.lnsf.entity.Order;
import cn.edu.lnsf.entity.OrdersProduct;

import java.util.List;

public interface OrderService {
    int createOrder(Order order, List<OrdersProduct> ordersProducts, int uid);
    List<Order> getAllOrdersByUid(Integer uid);
    List<OrdersProduct> getOrderDetailByOid(Integer oid);
}
