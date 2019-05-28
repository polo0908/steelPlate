
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cal.bean.AmountUnit;
import com.cal.dao.AmountUnitMapper;
import com.cal.dao.ProcessDetailsMapper;
import com.cal.dao.ProcessInfoMapper;
import com.yf.bean.HaiYunPort;
import com.yf.bean.PinXiang;
import com.yf.dao.HaiYunPortMapper;
import com.yf.dao.PinXiangMapper;
import com.yf.dao.ZhengGuiMapper;


public class Test1 {

	@Test
	
	public void updateById(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");

		
		AmountUnitMapper amountUnitMapper = ac.getBean(AmountUnitMapper.class);
		
		AmountUnit amountUnit = amountUnitMapper.queryByCurrency("人民币");

		System.out.println(amountUnit.getExchangeRate());
	}

	@Test
	public void saveClientOrder(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");

		
		AmountUnitMapper amountUnitMapper = ac.getBean(AmountUnitMapper.class);
		
		AmountUnit amountUnit = amountUnitMapper.queryByCurrency("人民币");

		System.out.println(amountUnit.getExchangeRate());
	}

	@Test
	public void queryProcess(){
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
		
		ProcessInfoMapper info = ac.getBean(ProcessInfoMapper.class);
		System.out.println(info.queryAll());
		
	}
	@Test
	public void saveProcessDetails(){
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
//		[{level3Parameter=200.0, unitPrice=0.3, orderDetailsId=92, unit=元/次, insideSurface=0, goodsProcessId=0, outsideSurface=0, level1Parameter=punching, level2Parameter=small}]
		ProcessDetailsMapper info = ac.getBean(ProcessDetailsMapper.class);
		ArrayList<Map<Object, Object>> list = new ArrayList<Map<Object,Object>>();
		Map<Object,Object> map= new HashMap<Object,Object>();
		map.put("orderDetailsId", 92);
    	map.put("goodsProcessId", 0);
		map.put("level1Parameter", "punching");
		map.put("level2Parameter", "small");
		map.put("level3Parameter", 200.0);				
		map.put("unitPrice", 0.3);
		map.put("unit", "元/次");
		map.put("outsideSurface", 0);
		map.put("insideSurface", 0);
		list.add(map);
		System.out.println(list);
		info.insertProcessDetails(list);
	}
	@Test
	public void queryLclDestinationPortByCountry(){
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
		PinXiangMapper haiYun = ac.getBean(PinXiangMapper.class);
		List<PinXiang> destinationPortByCountry = haiYun.queryLclDestinationPortByCountry("GERMANY");
		System.out.println(destinationPortByCountry);
	}
	
	@Test
	public void calculateAveragePrice(){
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
		ZhengGuiMapper haiYun = ac.getBean(ZhengGuiMapper.class);
        Double d = haiYun.calculateGP20AveragePrice("NAPIER");
		System.out.println(d);
	}
	

	
}
