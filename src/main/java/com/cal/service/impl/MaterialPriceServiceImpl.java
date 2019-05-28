package com.cal.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cal.bean.MaterialInfo;
import com.cal.dao.MaterialInfoMapper;
import com.cal.dao.MaterialPriceMapper;
import com.cal.service.MaterialPriceService;
import com.cal.util.DateFormat;


@Service
public class MaterialPriceServiceImpl implements MaterialPriceService {

	@Resource
	private MaterialPriceMapper materialPriceMapper;	
	@Resource
	private MaterialInfoMapper materialInfoMapper;
	
	
	@Transactional
	@Override
	public void updateMaterialPrice() {
		String materialType = "";  //材质类型
		Integer originalPrice = 0;
		String priceReplace = "";  //替换的内容
		String replaceType = "";   //替换的材质
		int replacePrice = 0;      //替换的价格
		List<MaterialInfo> materialInfos = materialInfoMapper.queryAllGroupByType();
		for (MaterialInfo materialInfo : materialInfos) {
			materialType = materialInfo.getMaterialType();
			priceReplace = materialInfo.getPriceReplace();
			originalPrice = materialInfo.getUnitPrice();
			
			//判断当前替换的材质类型和加减数值
			//生成新的价格，更新材质价格表
			if(priceReplace.contains("-") || priceReplace.contains("+")){
					if(priceReplace.contains("+")){
						String[] split = priceReplace.split("\\+");
						replaceType = split[0];
						replacePrice = Integer.parseInt(split[1]);
						Integer price = materialPriceMapper.getPriceByType(replaceType);
						Integer q235Price = materialPriceMapper.getPriceByType("Q235");
						//如果价格为空，寻找替换
						if(price == null){
							if("35CrMo".equals(replaceType)){
								price = q235Price+3850;
							}
							if("42CrMo".equals(replaceType)){
								price = q235Price+5500;
							}
						}
						
						//如果价格不为空更新价格				
						if(price != null && price > 0){
							String updateDate = DateFormat.currentDate();
							int newPrice = price+replacePrice;
							//当价格相差20%时，不进行更新
//							if(originalPrice*1.2<newPrice || originalPrice>newPrice*1.2){
//								continue;
//							}else{
								materialInfoMapper.updateMaterialPriceByType(newPrice, materialType,updateDate);
//							}							
						}
					}			
					if(priceReplace.contains("-")){
						String[] split = priceReplace.split("-");
						replaceType = split[0];
						replacePrice = Integer.parseInt(split[1]);
						Integer price = materialPriceMapper.getPriceByType(replaceType);
												
							if(price != null && price > 0){
								String updateDate = DateFormat.currentDate();
								int newPrice = price-replacePrice;
								//当价格相差20%时，不进行更新
//								if(originalPrice*1.2<newPrice || originalPrice>newPrice*1.2){
//									continue;
//								}else{
									materialInfoMapper.updateMaterialPriceByType(newPrice, materialType,updateDate);
//								}								
							}						
					}			
			}else{
				 Integer price = materialPriceMapper.getPriceByType(priceReplace);
				
					 if(price != null && price > 0){
							String updateDate = DateFormat.currentDate();
							 //当价格相差20%时，不进行更新
//							 if(originalPrice*1.2<price || originalPrice>price*1.2){
//								continue;
//							 }else{
								 materialInfoMapper.updateMaterialPriceByType(price, materialType,updateDate);
//							 }							
					 }
			}			
		}
		
		//删除大于一个月的价格抓取数据
		materialPriceMapper.deleteUpOneMonth();
		
	}
	
}
