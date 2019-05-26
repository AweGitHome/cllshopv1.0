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

    @Test
    public void test1(){
        //ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
        List<User> users = userMapper.selectByExample(new UserExample());
        System.out.println(users);
    }
}
