package cn.edu.lnsf.service;

import cn.edu.lnsf.entity.PageBean;
import cn.edu.lnsf.entity.Product;

import java.util.List;

public interface ProductsService {
    List<Product> getAllProducts();
    List<Product> getProductsByCondition(Product product);
    int addProduct(Product product);
    int updateProduct(Product product);
    int delProduct(int productId);
    PageBean getPageData(int curPage);
    boolean batchDel(List<Integer> ids);
    List<Product> getHotProduct();
    List<Product> getProductById(int productId);
    List<Product> getProductBySTId(int smallTypeId);
}
