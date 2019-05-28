package com.yf.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yf.bean.HaiYunPort;
import com.yf.bean.PinXiang;
import com.yf.bean.QueryPortInfo;

public interface PinXiangMapper {

	/**
	 * 通过输入的条件查询
	 * 
	 * @param record
	 * @return
	 */
	List<PinXiang> getAllPinXiang(QueryPortInfo portInfo);

	/**
	 * 查询所有的总记录数
	 * 
	 * @return
	 */
	Long getAllCount(QueryPortInfo portInfo);

	/**
	 * 根据传递的参数进行热门港口重复的数据查询
	 * 
	 * @return
	 */
	List<PinXiang> getHotPortRepeatList();

	/**
	 * 根据传递的参数进行热门港口没有重复的数据查询
	 * 
	 * @return
	 */
	List<PinXiang> getHotPortNoRepeatList();

	/**
	 * 根据传递的参数进行热门港口符合条件的查询
	 * 
	 * @param
	 * @return
	 */
	List<PinXiang> getMatchHotList(PinXiang pinXiang);

	/**
	 * 根据传递的参数进行重复的数据查询
	 * 
	 * @param QueryPortInfo
	 * @return
	 */
	List<PinXiang> getHasRepeatList(QueryPortInfo portInfo);

	/**
	 * 根据传递的参数进行没有重复的数据查询
	 * 
	 * @param QueryPortInfo
	 * @return
	 */
	List<PinXiang> getNoRepeatList(QueryPortInfo portInfo);

	/**
	 * 根据传递的参数进行符合条件的查询
	 * 
	 * @param
	 * @return
	 */
	List<PinXiang> getMatchList(PinXiang pinXiang);
	
	
	/**
	 * 根据国家
	 * 查询海运有拼箱运输的港口
	 * @return
	 */
	List<PinXiang> queryLclDestinationPortByCountry(@Param("enguoname") String country);
	
	/**
	 * 查询KGS平均价格
	 * @param country
	 * @param destinationPort
	 * @return
	 */
    Double calculatePriceByKGS(@Param("enguoname") String country,@Param("zhongDianRegion") String destinationPort);
    
    /**
     * 查询CBM平均价格
     * @param country
     * @param destinationPort
     * @return
     */
    Double calculatePriceByCBM(@Param("enguoname") String country,@Param("zhongDianRegion") String destinationPort);
}