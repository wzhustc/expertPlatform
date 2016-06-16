package cn.ustc.ep.mapper;

import cn.ustc.ep.po.Projectcheck;
import cn.ustc.ep.po.ProjectcheckExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProjectcheckMapper {
    int countByExample(ProjectcheckExample example);

    int deleteByExample(ProjectcheckExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Projectcheck record);

    int insertSelective(Projectcheck record);

    List<Projectcheck> selectByExample(ProjectcheckExample example);

    Projectcheck selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Projectcheck record, @Param("example") ProjectcheckExample example);

    int updateByExample(@Param("record") Projectcheck record, @Param("example") ProjectcheckExample example);

    int updateByPrimaryKeySelective(Projectcheck record);

    int updateByPrimaryKey(Projectcheck record);
}