package com.yf.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yf.bean.QueryPortInfo;
import com.yf.bean.ZhengGui;

public interface ZhengGuiService {
	
	/**
	 * 根据符合条件的进行全部查询
	 * @param QueryPortInfo
	 * @return List<ZhengGui>
	 */
    public List<ZhengGui>  getAll(QueryPortInfo portInfo);
    
    
    /**
     * 根据动态调节进行查询
     * @param QueryPortInfo
     * @return
     */
    public Long findListByDynamicCount(QueryPortInfo portInfo);
    
    
    /**
     * 根据符合条件的进行热门港口的重复项的查询
     * @return List<ZhengGui>
     */
    public List<ZhengGui> getHotPortRepeatList();
    
    /**
     * 根据符合条件的进行热门港口的无重复项的查询
     * @return List<ZhengGui>
     */
    public List<ZhengGui> getHotPortNoRepeatList();
    
    /**
     * 根据符合条件的进行热门港口的匹配的查询
     * @param zhengGui
     * @return
     */
    public List<ZhengGui> getMatchHotList(ZhengGui zhengGui);
    
    
    
    /**
     * 根据符合条件的进行重复项的查询
     * @param QueryPortInfo
     * @return List<ZhengGui>
     */
    public List<ZhengGui> getHasRepeatList(QueryPortInfo portInfo);
    
    /**
     * 根据符合条件的进行无重复项的查询
     * @param QueryPortInfo
     * @return List<ZhengGui>
     */
    public List<ZhengGui> getNoRepeatList(QueryPortInfo portInfo);
    
    /**
     * 根据符合条件的进行匹配的查询
     * @param ZhengGui
     * @return List<ZhengGui>
     */
    public List<ZhengGui> getMatchList(ZhengGui zhengGui);
    
	/**
	 * 查询GP20价格大于800USD的平均价
	 * @param          
	 * @return 
	 */
	public Double calculateGP20AveragePrice(@Param("zhongDianRegion") String destinationPort);
	
	/**
	 * 查询GP40价格大于800USD的平均价
	 * @param          
	 * @return 
	 */
	public Double calculateGP40AveragePrice(@Param("zhongDianRegion") String destinationPort);
	/**
	 * 查询HQ40价格大于800USD的平均价
	 * @param          
	 * @return 
	 */
	public Double calculateHQ40AveragePrice(@Param("zhongDianRegion") String destinationPort);
    
}
