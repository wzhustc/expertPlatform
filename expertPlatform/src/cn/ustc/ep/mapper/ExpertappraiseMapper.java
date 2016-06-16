package cn.ustc.ep.mapper;

import cn.ustc.ep.po.Expertappraise;
import cn.ustc.ep.po.ExpertappraiseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ExpertappraiseMapper {
    int countByExample(ExpertappraiseExample example);

    int deleteByExample(ExpertappraiseExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Expertappraise record);

    int insertSelective(Expertappraise record);

    List<Expertappraise> selectByExample(ExpertappraiseExample example);

    Expertappraise selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Expertappraise record, @Param("example") ExpertappraiseExample example);

    int updateByExample(@Param("record") Expertappraise record, @Param("example") ExpertappraiseExample example);

    int updateByPrimaryKeySelective(Expertappraise record);

    int updateByPrimaryKey(Expertappraise record);
}