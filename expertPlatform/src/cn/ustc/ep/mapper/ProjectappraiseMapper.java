package cn.ustc.ep.mapper;

import cn.ustc.ep.po.Projectappraise;
import cn.ustc.ep.po.ProjectappraiseExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProjectappraiseMapper {
    int countByExample(ProjectappraiseExample example);

    int deleteByExample(ProjectappraiseExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Projectappraise record);

    int insertSelective(Projectappraise record);

    List<Projectappraise> selectByExample(ProjectappraiseExample example);

    Projectappraise selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Projectappraise record, @Param("example") ProjectappraiseExample example);

    int updateByExample(@Param("record") Projectappraise record, @Param("example") ProjectappraiseExample example);

    int updateByPrimaryKeySelective(Projectappraise record);

    int updateByPrimaryKey(Projectappraise record);
}