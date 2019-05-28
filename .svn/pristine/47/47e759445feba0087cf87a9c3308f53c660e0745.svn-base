package com.cbt.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 构造用于页面显示的分页组件
 *
 */
public class SplitPage {

	/**
	 * @param request  request
	 * @param total  总的记录数
	 * @param pageSize  每页显示数量
	 * @param page  当前页
	 */
	@SuppressWarnings("rawtypes")
	public static String buildPager(HttpServletRequest request, int total,
			int pageSize, int page)  {
		if (page < 1) page = 1;		//当前页
		int pages = total / pageSize; //总页数
		if (pages * pageSize < total) pages++; //不能整除时总页数加1
		
		//截取URL参数?前面的部分
		// getRequestURI()： /easybuy/manage/productList?page=3
		String forwardAction = request.getRequestURI();
		forwardAction += "?";// /easybuy/manage/productList?
		//System.out.println("3:" + forwardAction);
		
		//获取已有的全部参数，并且将之拼接到URL上
		//page=3&name=aaa&sex=bbbb
		Map params = request.getParameterMap();
		if (params.size() > 0) {
			//page = 3  
			//name = aaa
			//sex = bbbb
			for (Iterator it = params.keySet().iterator(); it.hasNext();) {
				String key = (String) it.next();
				if ("page".equals(key))//忽略参数中的page项目（后面会添加）
					continue;
				String[] values = (String[]) params.get(key);
				if (values[0] != null && !values[0].trim().equals(""))				
						//将参数拼接到URL上，如果是中文，将之转换为iso8859-1
						forwardAction = forwardAction + key + "=" + values[0] + "&";
			}
			try {
				forwardAction = URLDecoder.decode(forwardAction, "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//上面运行结束后，forwardAction="/easybuy/manage/productList?name=aaa&sex=bbbb&"

		StringBuffer pager = new StringBuffer();
		pager.append("Total:" + total + "　pageSize：" + pageSize + " ");
		pager.append("\npaging:<span style='color:red'>" + page
				+ "</span>/<span style='color:red'>" + pages + "</span>　");
		pager.append("\npaging: ");
		
		//拼接首页和上页部分
		if (page > 1) {
			pager.append("\n<a href='#' onclick=\"aSubmit_page(1)\" title='First' class='a02'>[First]</a> ");
			pager.append("\n<a href='#' onclick=\"aSubmit_page("+(page - 1)+")\" title='Previous(第" + (page - 1)
					+ "page)' class='a02'>[Previous]</a> ");
		} else {
			pager.append("\n<span title=' The first page'>[First]</span> ");
			pager.append("\n<span title=' The first page'>[Previous]</span> ");
		}

		//拼接下页和尾页部分
		if (page < pages) {
			pager.append("\n<a href='#' onclick=\"aSubmit_page("+(page + 1)+")\" title='Next(The" + (page + 1)
					+ "page)' class='a02'>[Next]</a> ");
			pager.append("\n<a href='#' onclick=\"aSubmit_page("+pages+")\" title='The last page' class='a02'>[End]</a> ");
		} else {
			pager.append("\n<span title='The last page'>[Next]</span> ");
			pager.append("\n<span title='The last page'>[Last]</span> ");
		}

		pager.append("\n&nbsp;&nbsp;Jump to");
		pager.append("<input style='width:15px;height:12px' name='page' id='page' type='text' value='' size='3'/>page	");
		pager.append("\n<input type='button' value='submit' onclick='jumpPage();' />		");
		pager.append("\n<script>														");
		pager.append("\n  function jumpPage(){											");
		pager.append("\n  	var page = document.getElementById('page').value;			");
		pager.append("\n  	if(page=='' || isNaN(page)){								");
		pager.append("\n  		alert('Please enter a correct page number'); 								");
		pager.append("\n  		return false; 											");
		pager.append("\n  	} else {													");
		pager.append("\n  		page=parseInt(page);									");
		pager.append("\n  		if(page < 1 || page > " + pages + "){					");
		pager.append("\n  			alert('Source paramter is out of limit');return false;					");
		pager.append("\n  		}														");
		pager.append("\n  		aSubmit_page(page);                                     ");
		pager.append("\n  	}															");
		pager.append("\n  }																");
		pager.append("\n</script>														");
		//System.out.println(pager.toString());
		HttpSession session = request.getSession();
//		System.out.println(pager.toString());
		session.setAttribute("pager", pager.toString());
		
		return pager.toString();

	}
	
	
	
	
}
