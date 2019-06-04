package cn.edu.lnsf.dao;

import cn.edu.lnsf.entity.BigType;
import cn.edu.lnsf.entity.BigTypeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BigTypeMapper {
    int countByExample(BigTypeExample example);

    int deleteByExample(BigTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(BigType record);

    int insertSelective(BigType record);

    List<BigType> selectByExample(BigTypeExample example);

    BigType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") BigType record, @Param("example") BigTypeExample example);

    int updateByExample(@Param("record") BigType record, @Param("example") BigTypeExample example);

    int updateByPrimaryKeySelective(BigType record);

    int updateByPrimaryKey(BigType record);

    List<BigType> selAllTypes();
}