package cn.edu.lnsf.service.impl;

import cn.edu.lnsf.dao.ProductMapper;
import cn.edu.lnsf.entity.Product;
import cn.edu.lnsf.entity.ProductExample;
import cn.edu.lnsf.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class ProductServiceImpl implements ProductsService {
    @Autowired
    ProductMapper productMapper;

    public List<Product> getAllProducts() {
        return productMapper.selectByExample(new ProductExample());
    }

    public List<Product> getProductsByCondition(Product product) {
        return null;
    }

    public int addProduct(Product product) {
        return 0;
    }

    public int updateProduct(Product product) {
        return 0;
    }

    public int delProduct(int productId) {
        return 0;
    }
}
