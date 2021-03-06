package cn.edu.lnsf.dao;

import cn.edu.lnsf.entity.Product;
import cn.edu.lnsf.entity.ProductExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    int countByExample(ProductExample example);

    int deleteByExample(ProductExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    List<Product> selAllByStoreId(@Param("id") Integer storeId);

    Product selByStoreIdAndPid(@Param("sid") Integer storeId,@Param("pid") Integer pid);
}