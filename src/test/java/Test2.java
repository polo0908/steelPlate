
import java.util.List;




import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cbt.mapper.SteelPlateMapper;
import com.cbt.mapper.SteelSortDetailsMapper;
import com.cbt.model.SteelPlate;
import com.cbt.model.SteelSortDetails;




public class Test2 {

	@Test
	
	public void queryByPinming(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");

		
		SteelPlateMapper steelPlateMapper = ac.getBean(SteelPlateMapper.class);
		SteelSortDetailsMapper steelSortDetailsMapper = ac.getBean(SteelSortDetailsMapper.class);
		String[] sd = steelSortDetailsMapper.querySortByBelongType("碳钢圆管");
		String[] ds = {};
		System.out.println(ds.length);
		List<SteelPlate> list = steelPlateMapper.queryByPinMing(ds);
       
	}
	
	@Test
	public void querySortByBelongType(){
		
		ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("spring/spring-mybatis.xml");
		
		
		SteelSortDetailsMapper steelSortDetailsMapper = ac.getBean(SteelSortDetailsMapper.class);
		 String[] sd = steelSortDetailsMapper.querySortByBelongType("碳钢圆管");
		System.out.println(sd.toString());
	}

	

	
}
