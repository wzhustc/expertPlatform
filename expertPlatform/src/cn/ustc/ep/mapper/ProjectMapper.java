package cn.ustc.ep.mapper;

import cn.ustc.ep.mobilePo.MobileProject;
import cn.ustc.ep.po.Project;
import cn.ustc.ep.po.ProjectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProjectMapper {
    int countByExample(ProjectExample example);

    int deleteByExample(ProjectExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Project record);

    int insertSelective(Project record);

    List<Project> selectByExample(ProjectExample example);

    Project selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Project record, @Param("example") ProjectExample example);

    int updateByExample(@Param("record") Project record, @Param("example") ProjectExample example);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKey(Project record);

    //add  取出最新的projectSize条记录
	List<MobileProject> selectProjectByNewDate(int projectSize);
	List<MobileProject> selectProjectByNewDate2(int projectSize);
	//add  根据专家id查出对应的projectList;
	List<MobileProject> selectProjectListByEID(int eId);
	//add  根据公司id查出对应的projectList;
	List<MobileProject> selectProjectListByCID(int cId);
	//add  根据关键字key查出对应的projectList;
	List<MobileProject> selectProjectLikeKey(String key);
}