package com.yf.service;

import java.util.List;

import com.yf.bean.HaiYunPort;
import com.yf.bean.PinXiang;
import com.yf.bean.QueryPortInfo;

public interface PinXiangService {
	/**
	 * 动态分页查询
	 * 
	 * @param request
	 * @param pinXiang
	 * @param pageNo
	 * @return
	 */
	public List<PinXiang> getAllPinXiang(QueryPortInfo portInfo);

	/**
	 * 动态获取多少条记录数
	 * 
	 * @return
	 */
	public Long getAllCount(QueryPortInfo portInfo);
	
	/**
	 * 根据符合条件的进行热门港口重复项的查询
	 * @return List<PinXiang>
	 */
	public List<PinXiang> getHotPortRepeatList();

	/**
	 * 根据符合条件的进行热门港口无重复项的查询
	 * @return List<PinXiang>
	 */
	public List<PinXiang> getHotPortNoRepeatList();
	
	
	/**
	 * 根据符合条件的进行热门港口匹配的查询
	 * 
	 * @param PinXiang
	 * @return List<PinXiang>
	 */
	public List<PinXiang> getMatchHotList(PinXiang pinXiang);
	
	

	/**
	 * 根据符合条件的进行重复项的查询
	 * 
	 * @param QueryPortInfo
	 * @return List<PinXiang>
	 */
	public List<PinXiang> getHasRepeatList(QueryPortInfo portInfo);

	/**
	 * 根据符合条件的进行无重复项的查询
	 * 
	 * @param QueryPortInfo
	 * @return List<PinXiang>
	 */
	public List<PinXiang> getNoRepeatList(QueryPortInfo portInfo);

	/**
	 * 根据符合条件的进行匹配的查询
	 * 
	 * @param PinXiang
	 * @return List<PinXiang>
	 */
	public List<PinXiang> getMatchList(PinXiang pinXiang);
	
	/**
	 * 根据国家
	 * 查询海运有拼箱运输的港口
	 * @return
	 */
	public List<PinXiang> queryLclDestinationPortByCountry(String country);
	
	
	/**
	 * 查询KGS平均价格
	 * @param country
	 * @param destinationPort
	 * @return
	 */
    Double calculatePriceByKGS(String country,String destinationPort);
    
    /**
     * 查询CBM平均价格
     * @param country
     * @param destinationPort
     * @return
     */
    Double calculatePriceByCBM(String country,String destinationPort);

}
