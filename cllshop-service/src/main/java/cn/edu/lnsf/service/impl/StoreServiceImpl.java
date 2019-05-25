package cn.edu.lnsf.service.impl;

import cn.edu.lnsf.dao.StoreMapper;
import cn.edu.lnsf.entity.Store;
import cn.edu.lnsf.entity.StoreExample;
import cn.edu.lnsf.service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StoreServiceImpl implements StoreService {
    @Autowired
    StoreMapper storeMapper;

    public List<Store> getAllStore() {
        return storeMapper.selectByExample(new StoreExample());
    }
}
