package cn.edu.lnsf.service.impl;

import cn.edu.lnsf.dao.OrderMapper;
import cn.edu.lnsf.dao.OrdersProductMapper;
import cn.edu.lnsf.dao.ProductMapper;
import cn.edu.lnsf.entity.*;
import cn.edu.lnsf.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    OrdersProductMapper ordersProductMapper;
    @Autowired
    ProductMapper productMapper;

    public int createOrder(Order order, List<OrdersProduct> ordersProducts, int uid) {
        int temp = 0;
        for (OrdersProduct ordersProduct : ordersProducts){
            if(ordersProduct.getNum()==0){
                continue;
            }
            temp += ordersProduct.getNum()*ordersProduct.getUnit()*100;
        }
        Long cost = Long.parseLong(temp+"");
        order.setCost(cost);
        order.setCreatetime(new Date());
        order.setOrdernum(UUID.randomUUID().toString());
        order.setUserid(uid);
        int i = orderMapper.insertSelective(order);
        int orderId = order.getId();
        ProductExample example =null;
        if(i!=0){
            for (OrdersProduct ordersProduct : ordersProducts){
                int num = ordersProduct.getNum();
                if(num==0){
                    continue;
                }
                example = new ProductExample();
                example.createCriteria().andIdEqualTo(ordersProduct.getProductid());
                ordersProduct.setOrderid(orderId);
                ordersProductMapper.insertSelective(ordersProduct);
                List<Product> products = productMapper.selectByExample(example);
                Product product = products.get(0);
                int stock = product.getStock()-num;
                product.setStock(stock);
                productMapper.updateByPrimaryKeySelective(product);
            }
        }
        return i;
    }

    public List<Order> getAllOrdersByUid(Integer uid) {
        OrderExample orderExample = new OrderExample();
        orderExample.createCriteria().andUseridEqualTo(uid);
        List<Order> orders = orderMapper.selectByExample(orderExample);
        return orders;
    }

    public List<OrdersProduct> getOrderDetailByOid(Integer oid) {
        List<OrdersProduct> list = ordersProductMapper.selByOrderId(oid);
        return list;
    }
}
