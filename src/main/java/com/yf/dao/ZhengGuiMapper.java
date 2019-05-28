package com.yf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yf.bean.QueryPortInfo;
import com.yf.bean.ZhengGui;

public interface ZhengGuiMapper {
	/**
	 * 通过输入的条件查询
	 * @param QueryPortInfo
	 * @return List<ZhengGui>
	 */
	List<ZhengGui> getAll(QueryPortInfo portInfo);

	/**
	 * 根据传递的参数是不是有值进行有效的查询
	 * @param QueryPortInfo           
	 * @return Long
	 */
	Long findListByDynamicCount(QueryPortInfo portInfo);
	
	
	/**
	 * 通过输入的条件查询热门港口的重复的数据
	 * @return List<ZhengGui>
	 */
	List<ZhengGui> getHotPortRepeatList();
	
	
	/**
	 * 通过输入的条件查询热门港口的重复的数据
	 * @return List<ZhengGui>
	 */
	List<ZhengGui> getHotPortNoRepeatList();
	
	
	/**
	 * 根据传递的参数进行热门港口符合条件的查询
	 * @param          
	 * @return 
	 */
	List<ZhengGui> getMatchHotList(ZhengGui zhengGui);
	
	
	
	/**
	 * 根据传递的参数进行重复的数据查询
	 * @param QueryPortInfo           
	 * @return List<ZhengGui>
	 */
	List<ZhengGui> getHasRepeatList(QueryPortInfo portInfo);
	
	/**
	 * 根据传递的参数进行没有重复的数据查询
	 * @param QueryPortInfo           
	 * @return List<ZhengGui>
	 */
	List<ZhengGui> getNoRepeatList(QueryPortInfo portInfo);
	
	/**
	 * 根据传递的参数进行符合条件的查询
	 * @param          
	 * @return 
	 */
	List<ZhengGui> getMatchList(ZhengGui zhengGui);
	
	/**
	 * 查询GP20价格大于800USD的平均价
	 * @param          
	 * @return 
	 */
	Double calculateGP20AveragePrice(@Param("zhongDianRegion") String destinationPort);
	
	/**
	 * 查询GP40价格大于800USD的平均价
	 * @param          
	 * @return 
	 */
	Double calculateGP40AveragePrice(@Param("zhongDianRegion") String destinationPort);
	/**
	 * 查询HQ40价格大于800USD的平均价
	 * @param          
	 * @return 
	 */
	Double calculateHQ40AveragePrice(@Param("zhongDianRegion") String destinationPort);
	
}