package com.cbt.mapper;

import com.cbt.model.SteelPlateOrder;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface SteelPlateOrderMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(SteelPlateOrder order);

    int insertSelective(SteelPlateOrder record);

    SteelPlateOrder selectByPrimaryKey(String itemId);

    int updateByPrimaryKeySelective(SteelPlateOrder record);

    int updateByPrimaryKey(SteelPlateOrder record);
}