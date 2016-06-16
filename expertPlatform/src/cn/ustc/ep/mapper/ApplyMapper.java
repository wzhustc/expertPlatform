package cn.ustc.ep.mapper;

import cn.ustc.ep.po.Apply;
import cn.ustc.ep.po.ApplyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ApplyMapper {
    int countByExample(ApplyExample example);

    int deleteByExample(ApplyExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Apply record);

    int insertSelective(Apply record);

    List<Apply> selectByExample(ApplyExample example);

    Apply selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Apply record, @Param("example") ApplyExample example);

    int updateByExample(@Param("record") Apply record, @Param("example") ApplyExample example);

    int updateByPrimaryKeySelective(Apply record);

    int updateByPrimaryKey(Apply record);
}