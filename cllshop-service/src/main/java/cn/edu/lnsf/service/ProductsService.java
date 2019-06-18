package cn.edu.lnsf.service;

import cn.edu.lnsf.entity.PageBean;
import cn.edu.lnsf.entity.Product;

import java.util.List;

public interface ProductsService {
    List<Product> getAllProducts(int sid);
    List<Product> getProductsByCondition(Product product);
    int addProduct(Product product);
    int updateProduct(Product product);
    int delProduct(int productId);
    PageBean getPageData(int curPage,int sid);
    boolean batchDel(List<Integer> ids);
    List<Product> getHotProduct();
    List<Product> getProductById(int productId);
    List<Product> getProductBySTId(int smallTypeId);
    Product getOneByIdAndSid(int pid,int sid);
    List<Product> getProdByIds(List<Integer> ids);
    List<Product> getProductByStoId(int storeId);
    List<Product> getLastProduct();
}
