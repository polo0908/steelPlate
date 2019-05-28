package com.cal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cal.bean.MaterialInfo;

public interface MaterialInfoMapper {
	
	/**
	 * 查询产品对应材料信息
	 * @return
	 */
	List<MaterialInfo> queryByGoodsType(String goodsType);
	
	/**
	 * 根据id查询产品信息
	 * @param id
	 * @return
	 */
	MaterialInfo queryById(Integer id);
	/**
	 * 根据materialType查询产品信息
	 * @param materialType
	 * @return
	 */
	MaterialInfo queryByType(@Param("materialType") String materialType,@Param("goodsType")String goodsType);
	
	
	/**
	 * 根据材质类型去重查询
	 * @Title queryAllGroupByType 
	 * @Description
	 * @return
	 * @return List<MaterialInfo>
	 */
	List<MaterialInfo> queryAllGroupByType();
	
	
	/**
	 * 根据材质类型更新价格
	 * @Title updateMaterialPriceByType 
	 * @Description
	 * @param materialType  材质类型
	 * @param unitPrice  材质单价
	 * @return
	 * @return int
	 */
	int updateMaterialPriceByType(@Param("unitPrice") int unitPrice,@Param("materialType") String materialType,@Param("updateDate") String updateDate);

}
