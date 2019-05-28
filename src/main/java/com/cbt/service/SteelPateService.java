package com.cbt.service;

import java.util.List;












import org.apache.ibatis.annotations.Param;

import com.cbt.model.SteelPateCategory;
import com.cbt.model.SteelPlate;
import com.cbt.model.SteelPlateOrder;

public interface SteelPateService  {

		
		/**
		 * 查询单个产品信息
		 * @param id
		 * @return
		 */
		SteelPlate findById1(Integer id);
		
		/**
		 * 保存订单信息
		 */
		int saveGoods(SteelPlateOrder order);
		
		
  
		 /**
	     * 根据关系字搜索查询产品
	     * @param steelPlate
	     * @return
	     */
	  public List<SteelPlate> queryByKey(SteelPlate steelPlate);
	  
	  
	   /**
	     * 根据关键字查询数量
	     * @param steelPlate
	     * @return
	     */
	   public int queryTotal(SteelPlate steelPlate);
	   
	   /**
	    * 根据itmeId查询
	    * @param itmeId
	    * @return
	    */
	   public SteelPlateOrder selectByPrimaryKey(String itemId);
	   
	   
	   /**
	     * 根据种类和品名查询数据
	     * @param zhonglei
	     * @param pinming
	     * @return
	     */
	   public List<SteelPlate> queryByPinMing(String... pinming);
	   
	   
	    /**
	     * 根据种类和品名查询数据
	     * @param zhonglei
	     * @param pinming
	     * @return
	     */
	   public  List<SteelPlate> queryPinMing(String pinming);
}
