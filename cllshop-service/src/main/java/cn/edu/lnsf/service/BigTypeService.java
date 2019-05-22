package cn.edu.lnsf.service;

import cn.edu.lnsf.entity.BigType;

import java.util.List;

public interface BigTypeService {
    /**
     * 查找全部
     * @return
     */
    List<BigType> findAll();

    /**
     * 新增
     * @param bigType
     * @return
     */
    int addBigType(BigType bigType);

    /**
     * 修改
     * @param bigType
     * @return
     */
    int updateBigType(BigType bigType);

    /**
     * 删除，软删除，将flag置为删除标志
     * @param bigType
     * @return
     */
    int delBigType(BigType bigType);
}
