package com.cbt.mapper;

import com.cbt.model.SteelPlate;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SteelPlateMapper {

    int insert(SteelPlate record);


    SteelPlate selectByPrimaryKey(Integer id);

    
    /**
     * 根据关系字搜索查询产品
     * @param steelPlate
     * @return
     */
    List<SteelPlate> queryByKey(SteelPlate steelPlate);
    
    /**
     * 根据关键字查询数量
     * @param steelPlate
     * @return
     */
    int queryTotal(SteelPlate steelPlate);
    
    
    /**
     * 根据种类和品名查询数据
     * @param zhonglei
     * @param pinming
     * @return
     */
    List<SteelPlate> queryByPinMing(String... pinming);
    
    
    /**
     * 根据种类和品名查询数据
     * @param zhonglei
     * @param pinming
     * @return
     */
    List<SteelPlate> queryPinMing(String pinming);
    
    /**
     * 根据品名查询材质(先查询steel_sort_details表对应的品名)
     * @param pinming
     * @return
     */
    List<String> queryCaizhiByPinMingOld(String pinming);
    
    /**
     * 根据品名材质查询所有规格产品
     * @param pinming
     * @param caiZhi
     * @return
     */
    List<SteelPlate> querySteelPlateByHighOld(String pinming,String caiZhi);
    
    /**
     * 根据品名查询材质(先查询steel_sort_details表对应的品名)
     * @param pinming
     * @return
     */
    List<String> queryCaizhiByPinMingNew(String pinming);
    
    /**
     * 根据品名材质查询所有规格产品
     * @param pinming
     * @param caiZhi
     * @return
     */
    List<SteelPlate> querySteelPlateByHighNew(String pinming,String caiZhi);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}