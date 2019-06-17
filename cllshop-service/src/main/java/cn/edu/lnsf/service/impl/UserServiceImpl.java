package cn.edu.lnsf.service.impl;

import cn.edu.lnsf.dao.UserMapper;
import cn.edu.lnsf.entity.User;
import cn.edu.lnsf.entity.UserExample;
import cn.edu.lnsf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.jws.soap.SOAPBinding;
import java.util.List;
@Service
public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User login(User user) {
        String userPassword = user.getPassword();
        UserExample example = new UserExample();
        example.createCriteria().andUsernameEqualTo(user.getUsername()).andPasswordEqualTo(userPassword);
        List<User> users = userMapper.selectByExample(example);
        if(users!=null&&users.size()>0){
            return users.get(0);
        }
        return null;
    }

    public int userRegister(User user) {
        String password = user.getPassword();
        //密码进行MD5加密
        String s = DigestUtils.md5DigestAsHex(password.getBytes());
        user.setPassword(s);
        if(userMapper.insertSelective(user)!=0){
            return 1;
        }
        return 0;
    }

    public boolean checkUserIsExist(User user) {
        UserExample example = new UserExample();
        example.createCriteria().andUsernameEqualTo(user.getUsername());
        List<User> users = userMapper.selectByExample(example);
        if(users!=null&&users.size()>0){
            return true;
        }
        return false;
    }

    public List<User> getAllUser() {
        return userMapper.selectByExample(new UserExample());
    }

    public int editUser(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    public boolean checkEmailIsUsed(User user) {
        UserExample example = new UserExample();
        example.createCriteria().andEmailEqualTo(user.getEmail());
        if(userMapper.selectByExample(example).size()!=0){
            return true;
        }
        return false;
    }

    public int updateUser (User user){
        return userMapper.updateByPrimaryKeySelective(user);
    }

    public User  getUserByUsername(String userName){
       UserExample example = new UserExample();
       example.createCriteria().andUsernameEqualTo(userName);
        List<User> user = userMapper.selectByExample(example);
       return user.get(0);
    }

    public User  getUserById(int userId){
        UserExample example = new UserExample();
        example.createCriteria().andIdEqualTo(userId);
        List<User> user = userMapper.selectByExample(example);
        return user.get(0);
    }
}
