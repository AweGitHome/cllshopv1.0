import cn.edu.lnsf.dao.*;
import cn.edu.lnsf.entity.Product;
import cn.edu.lnsf.entity.ProductExample;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


//指定bean注入的配置文件
@ContextConfiguration(locations = { "classpath*:applicationContext-*.xml"})
//使用标准的JUnit @RunWith注释来告诉JUnit使用Spring TestRunner
@RunWith(SpringJUnit4ClassRunner.class)
public class UserDaoTest {
    @Autowired
    UserMapper userMapper;
    @Autowired
    ProductMapper productMapper;
    @Autowired
    BigTypeMapper bigTypeMapper;
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    OrdersProductMapper ordersProductMapper;

    @Test
    public void test1(){
        ProductExample example = new ProductExample();
        example.setOrderByClause("createtime desc limit 8");
        List<Product> products = productMapper.selectByExample(example);
        return;
    }
}
