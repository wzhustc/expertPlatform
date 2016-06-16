package cn.ustc.ep.mapper;

import cn.ustc.ep.po.Expertcheck;
import cn.ustc.ep.po.ExpertcheckExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExpertcheckMapper {
    int countByExample(ExpertcheckExample example);

    int deleteByExample(ExpertcheckExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Expertcheck record);

    int insertSelective(Expertcheck record);

    List<Expertcheck> selectByExample(ExpertcheckExample example);

    Expertcheck selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Expertcheck record, @Param("example") ExpertcheckExample example);

    int updateByExample(@Param("record") Expertcheck record, @Param("example") ExpertcheckExample example);

    int updateByPrimaryKeySelective(Expertcheck record);

    int updateByPrimaryKey(Expertcheck record);
}