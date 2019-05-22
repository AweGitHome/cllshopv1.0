package cn.edu.lnsf.service.impl;

import cn.edu.lnsf.dao.BigTypeMapper;
import cn.edu.lnsf.entity.BigType;
import cn.edu.lnsf.entity.BigTypeExample;
import cn.edu.lnsf.service.BigTypeService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BigTypeServiceImpl implements BigTypeService {
    @Autowired
    BigTypeMapper bigTypeMapper;

    public List<BigType> findAll() {
        return bigTypeMapper.selectByExample(new BigTypeExample());
    }

    public int addBigType(BigType bigType) {
        return bigTypeMapper.insertSelective(bigType);
    }

    public int updateBigType(BigType bigType) {
        return bigTypeMapper.updateByPrimaryKeySelective(bigType);
    }

    public int delBigType(BigType bigType) {
        bigType.setStatus(0);
        return bigTypeMapper.updateByPrimaryKeySelective(bigType);
    }
}
