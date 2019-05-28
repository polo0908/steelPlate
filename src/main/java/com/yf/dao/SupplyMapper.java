package com.yf.dao;

import com.yf.bean.Supply;

public interface SupplyMapper {
    int deleteByPrimaryKey(Integer itemid);

    int insert(Supply record);

    int insertSelective(Supply record);

    Supply selectByPrimaryKey(Integer itemid);

    int updateByPrimaryKeySelective(Supply record);

    int updateByPrimaryKey(Supply record);
}