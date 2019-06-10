package cn.edu.lnsf.service.impl;

import cn.edu.lnsf.dao.SmallTypeMapper;
import cn.edu.lnsf.entity.SmallType;
import cn.edu.lnsf.entity.SmallTypeExample;
import cn.edu.lnsf.service.SmallTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SmallTypeImpl implements SmallTypeService {
    @Autowired
    SmallTypeMapper smallTypeMapper;

    public List<SmallType> findAll() {
        return null;
    }

    public List<SmallType> findByBid(int bid) {
        SmallTypeExample example = new SmallTypeExample();
        example.createCriteria().andBigtypeEqualTo(bid);
        return smallTypeMapper.selectByExample(example);
    }
}
