package com.cal.dao;

import org.apache.ibatis.annotations.Param;

import com.cal.bean.MaterialPrice;

public interface MaterialPriceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MaterialPrice record);

    int insertSelective(MaterialPrice record);

    MaterialPrice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MaterialPrice record);

    int updateByPrimaryKey(MaterialPrice record);
    
    
    /**
     * 根据材质详情类型获取价格
     * @Title materialDetail 
     * @Description 
     * @param materialDetail 材质详情类型   
     * @return
     * @return int
     */
    Integer getPriceByType(@Param("materialDetail") String materialDetail);
    
    
    /**
     * 删除一个月前的价格数据
     * @Title deleteUpOneMonth 
     * @Description
     * @return
     * @return int
     */
    int deleteUpOneMonth();
}