package cn.edu.lnsf.entity;

import java.io.Serializable;
import java.util.List;

public class OrderCustom implements Serializable {
    private List<OrdersProduct> ordersProduct;
    private long cost;

    public List<OrdersProduct> getOrdersProduct() {
        return ordersProduct;
    }

    public void setOrdersProduct(List<OrdersProduct> ordersProduct) {
        this.ordersProduct = ordersProduct;
    }

    public long getCost() {
        return cost;
    }

    public void setCost(long cost) {
        this.cost = cost;
    }
}
