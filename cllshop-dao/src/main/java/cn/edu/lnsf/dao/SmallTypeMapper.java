package cn.edu.lnsf.dao;

import cn.edu.lnsf.entity.SmallType;
import cn.edu.lnsf.entity.SmallTypeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SmallTypeMapper {
    int countByExample(SmallTypeExample example);

    int deleteByExample(SmallTypeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(SmallType record);

    int insertSelective(SmallType record);

    List<SmallType> selectByExample(SmallTypeExample example);

    SmallType selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") SmallType record, @Param("example") SmallTypeExample example);

    int updateByExample(@Param("record") SmallType record, @Param("example") SmallTypeExample example);

    int updateByPrimaryKeySelective(SmallType record);

    int updateByPrimaryKey(SmallType record);
}