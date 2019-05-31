import cn.edu.lnsf.dao.BigTypeMapper;
import cn.edu.lnsf.dao.ProductMapper;
import cn.edu.lnsf.dao.UserMapper;
import cn.edu.lnsf.entity.Product;
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

    @Test
    public void test1(){
        //ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
        //BigType bigType = bigTypeMapper.selAllSmallTypeById(1);
//        List<Product> list = productMapper.selAll();
//        productMapper.selAll();
        List<Product> list = productMapper.selAllByStoreId(2);
        System.out.println(list);
    }
}
