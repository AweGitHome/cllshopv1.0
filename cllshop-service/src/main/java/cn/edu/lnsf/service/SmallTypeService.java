package cn.edu.lnsf.service;

import cn.edu.lnsf.entity.SmallType;

import java.util.List;

public interface SmallTypeService {
    List<SmallType> findAll();
    List<SmallType> findByBid(int bid);
    SmallType findByid(int smallId);
}
