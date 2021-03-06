package cn.edu.lnsf.service.impl;

import cn.edu.lnsf.dao.BigTypeMapper;
import cn.edu.lnsf.entity.BigType;
import cn.edu.lnsf.service.BigTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BigTypeServiceImpl implements BigTypeService {
    @Autowired
    BigTypeMapper bigTypeMapper;

    public List<BigType> findAll() {
        return bigTypeMapper.selAllTypes();
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
