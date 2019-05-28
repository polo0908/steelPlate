package com.yf.dao;

import com.yf.bean.Myplas;

public interface MyplasMapper {
	int deleteByPrimaryKey(Integer itemid);

	int insert(Myplas record);

	int insertSelective(Myplas record);

	Myplas selectByPrimaryKey(Integer itemid);

	int updateByPrimaryKeySelective(Myplas record);

	int updateByPrimaryKey(Myplas record);
}