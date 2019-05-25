package cn.edu.lnsf.service.impl;

import cn.edu.lnsf.dao.ProductMapper;
import cn.edu.lnsf.entity.PageBean;
import cn.edu.lnsf.entity.Product;
import cn.edu.lnsf.entity.ProductExample;
import cn.edu.lnsf.service.ProductsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
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

    public PageBean getPageData(int curPage) {
        PageBean pageBean = new PageBean();
        PageHelper.startPage(curPage,pageBean.getPageSize());
        List<Product> list = getAllProducts();
        //取分页信息
        PageInfo<Product> pageInfo = new PageInfo<Product>(list);
        long total = pageInfo.getTotal();
        pageBean.setData(list);
        pageBean.setTotalCount((int)total);
        pageBean.setCurPage(curPage);
        return pageBean;
    }
}
