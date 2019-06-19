package cn.edu.lnsf.service;

import cn.edu.lnsf.entity.User;

import java.util.List;

public interface UserService {
    /**
     * 登录
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 用户注册
     * @param user
     * @return
     */
    int userRegister(User user);

    /**
     * 检查用户是否存在
     * @param user
     * @return
     */
    boolean checkUserIsExist(User user);

    /**
     * 获取所有用户
     * @return
     */
    List<User> getAllUser();

    /**
     * 用户修改信息
     * @param user
     * @return
     */
    int editUser(User user);

    boolean checkEmailIsUsed(User user);

    int updateUser(User user);

    User getUserByUsername(String userName);

    User getUserById(int userId);

    boolean checkPasswordIsRight(User user);
}
