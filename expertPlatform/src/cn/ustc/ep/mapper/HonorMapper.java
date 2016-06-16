package cn.ustc.ep.mapper;

import cn.ustc.ep.po.Honor;
import cn.ustc.ep.po.HonorExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface HonorMapper {
    int countByExample(HonorExample example);

    int deleteByExample(HonorExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Honor record);

    int insertSelective(Honor record);

    List<Honor> selectByExample(HonorExample example);

    Honor selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Honor record, @Param("example") HonorExample example);

    int updateByExample(@Param("record") Honor record, @Param("example") HonorExample example);

    int updateByPrimaryKeySelective(Honor record);

    int updateByPrimaryKey(Honor record);
}