package cn.edu.lnsf.dao;

import cn.edu.lnsf.entity.OrdersProduct;
import cn.edu.lnsf.entity.OrdersProductExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersProductMapper {
    int countByExample(OrdersProductExample example);

    int deleteByExample(OrdersProductExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(OrdersProduct record);

    int insertSelective(OrdersProduct record);

    List<OrdersProduct> selectByExample(OrdersProductExample example);

    OrdersProduct selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") OrdersProduct record, @Param("example") OrdersProductExample example);

    int updateByExample(@Param("record") OrdersProduct record, @Param("example") OrdersProductExample example);

    int updateByPrimaryKeySelective(OrdersProduct record);

    int updateByPrimaryKey(OrdersProduct record);
}