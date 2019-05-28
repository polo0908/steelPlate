package com.yf.spider.dataDeal;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.yf.spider.util.DbPoolUtil;

/*
 * yf_zhengguitable表爬虫后执行的语句 请按照顺序删除和修改数据
 */
public class ZhengguiDataDeal {

	// 1.删除yf_zhengguitable表有效期小于当前时间的数据
	public void deleteOverdue(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		String delSql = "delete from yf_zhengguitable where youXiaoQi < sysdate() " + portWhereSql;
		try {
			Statement stmt = conn.createStatement();
			stmt.execute(delSql);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("deleteOverdue执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	// 2.清理yf_zhengguitable表船公司不合理的数据。
	public void deleteShippingCompany(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		List<String> errShippingLst = getErrorShippingSqlList(chinaPortEnName, foreignPortEnName);
		try {
			Statement stmt = conn.createStatement();
			for (String delSql : errShippingLst) {
				stmt.execute(delSql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("deleteShippingCompany执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	// 3.删除yf_zhengguitable表完全重复的数据，调用mysql存储过程deal_yf_zhengguiData_repeat
	public void deleteRepeat(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		String sql = "{CALL deal_yf_zhengguiData_repeat('" + chinaPortEnName + "','" + foreignPortEnName + "')}"; // 调用删除整箱重复数据的存储过程,无参数传递
		CallableStatement cstm = null;
		try {
			cstm = conn.prepareCall(sql);// 实例化对象cstm
			cstm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("deleteRepeat执行失败，原因：" + e.getMessage());
		} finally {
			try {
				cstm.close();// 关闭对象cstm
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DbPoolUtil.returnConnection(conn);
		}
	}

	// 4.删除yf_zhengguitable表价格不合理数据
	public void deleteUnreasonable(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		List<String> errLst = getErrorSqlList(chinaPortEnName, foreignPortEnName);
		try {
			Statement stmt = conn.createStatement();
			for (String delSql : errLst) {
				stmt.execute(delSql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("deleteUnreasonable执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	// 5.去掉yf_zhengguitable表所有含有美元货币数据的货币单位
	public void takeOutUsd(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		List<String> usdSqlLst = getUsdSqlLst(chinaPortEnName, foreignPortEnName);
		try {
			Statement stmt = conn.createStatement();
			for (String delSql : usdSqlLst) {
				stmt.execute(delSql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("takeOutUsd执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	// 6.转换yf_zhengguitable表其他货币到美元
	public void changeToDollar(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		List<String> changeSqlLst = getChangeSqlLst(chinaPortEnName, foreignPortEnName);
		try {
			Statement stmt = conn.createStatement();

			for (String sql : changeSqlLst) {
				stmt.execute(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("changeToDollar执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}

	}

	// 7.清除yf_zhengguitable表带有","的价格数据
	public void clearComma(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		List<String> clearCommaSqlLst = getClearCommaSqlLst(chinaPortEnName, foreignPortEnName);
		try {
			Statement stmt = conn.createStatement();

			for (String sql : clearCommaSqlLst) {
				stmt.execute(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("clearComma执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}

	}

	// 8.清除yf_zhengguitable表价格数据区间的数据（如：36/50）,保留/前面的数据。以及中间部分有+号的数据，如：80+35
	public void clearInterval(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		List<String> clearIntervalSqlLst = getClearIntervalSqlLst(chinaPortEnName, foreignPortEnName);
		try {
			Statement stmt = conn.createStatement();
			for (String sql : clearIntervalSqlLst) {
				stmt.execute(sql);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("clearInterval执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	// 9.整理完前面的数据，删除yf_zhengguitable表可能存在是负数和0,1的数据
	public void deleteLess(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String fieldIsZeroOrOneSql = "delete from yf_zhengguitable where GP20 in('0','1') or  GP40 in('0','1') "
					+ "or  HQ40 in('0','1');";// 删除字段存在为0、1的数据
			String fieldIsNegativeSql = "delete from yf_zhengguitable  "
					+ "where trim(GP20) like '-%'  or trim(GP40) like '-%' or trim(HQ40) like '-%';";// 删除字段存在为负数的数据
			stmt.execute(fieldIsZeroOrOneSql);
			stmt.execute(fieldIsNegativeSql);

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("deleteLess执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	// yf_zhengguitable表船公司不合理数据集合
	private List<String> getErrorShippingSqlList(String chinaPortEnName, String foreignPortEnName) {
		List<String> errValueLst = new ArrayList<String>();
		List<String> errSqlLst = new ArrayList<String>();

		// 目前发现的不合理的字段数据，以后发现的从这里添加数据
		errValueLst.add("电联");
		errValueLst.add("电讯");
		errValueLst.add("电询");
		errValueLst.add("现询");
		errValueLst.add("**");
		errValueLst.add("··");
		errValueLst.add("``");
		errValueLst.add("XXX");
		errValueLst.add("EEE");
		errValueLst.add("多个选择");
		errValueLst.add("多家船东");
		errValueLst.add("外运");
		errValueLst.add("详电");
		errValueLst.add("详询");
		errValueLst.add("船东M");
		errValueLst.add("特价船");
		errValueLst.add("周一");
		errValueLst.add("周三");
		errValueLst.add("周六");
		errValueLst.add("其他");
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		for (String errv : errValueLst) {
			String errSql = "delete from yf_zhengguitable where chuanCompany like '%" + errv + "%' " + portWhereSql;// 采用模糊匹配模式删除
			errSqlLst.add(errSql);
		}
		String fieldIsLessSql = "delete from yf_zhengguitable where length(chuanCompany) <2 " + portWhereSql;// 删除字段chuanCompany长度小于2的数据
		errSqlLst.add(fieldIsLessSql);
		String fieldHasNumSql = "delete from yf_zhengguitable where chuanCompany regexp '[0-9]' " + portWhereSql;// 删除字段chuanCompany数字的，基本上是电话、手机号码和QQ的
		errSqlLst.add(fieldHasNumSql);
		String fieldIsDianSql = "delete from yf_zhengguitable where (chuanCompany='电' or chuanCompany='的') "
				+ portWhereSql;// 删除字段chuanCompany值为"电"和"的"的数据
		errSqlLst.add(fieldIsDianSql);
		String fieldIsHanJSql = "delete from yf_zhengguitable where (chuanCompany='HANJIN' or chuanCompany='韩进') "
				+ portWhereSql;// 删除字段chuanCompany值为"韩进"的数据
		errSqlLst.add(fieldIsHanJSql);
		return errSqlLst;
	}

	// yf_zhengguitable表不合理数据集合，GP20,GP40,HQ40都匹配同样的数据
	private List<String> getErrorSqlList(String chinaPortEnName, String foreignPortEnName) {
		List<String> errData = new ArrayList<String>();

		errData.add("停航");
		errData.add("特价");

		errData.add("不接");
		errData.add("此全卡不接");
		errData.add("停接");

		errData.add("单case");
		errData.add("单票");
		errData.add("票议");
		errData.add("现议");

		errData.add("单询");
		errData.add("电询");
		errData.add("实询");

		errData.add("退");

		errData.add("case bycase");
		errData.add("n/f");
		errData.add("N/M");
		errData.add("NIL");

		errData.add("Pending");
		errData.add("#REF!");

		errData.add("stop");
		errData.add("SIN+");

		errData.add("#VALUE!");
		errData.add("X");

		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		List<String> errLst = new ArrayList<String>();
		for (String errV : errData) {
			String delSql = "delete from yf_zhengguitable where GP20 like '%" + errV + "%' and GP40 like '%" + errV
					+ "%' and HQ40 like '%" + errV + "%' " + portWhereSql;// GP20,GP40,HQ40字段匹配
			String delGp20Sql = "delete from yf_zhengguitable where GP20 like '%" + errV + "%' and GP40='' and HQ40='' "
					+ portWhereSql;// GP20字段匹配,GP40,HQ40为空
			errLst.add(delSql);
			errLst.add(delGp20Sql);
		}
		String fieldIsNullSql = "delete from yf_zhengguitable where GP20=''  and GP40='' and HQ40='' " + portWhereSql;// 删除字段全部为空的数据
		errLst.add(fieldIsNullSql);
		String fieldIsToLongSql = "delete from yf_zhengguitable  "
				+ "where (length(GP20) >10 or length(GP40) >10 or length(HQ40) >10) " + portWhereSql;// 删除字段全部为不为数字的数据
		errLst.add(fieldIsToLongSql);
		String fieldIsHqSql = "delete from yf_zhengguitable where GP20 like '%hq%' and  GP40='' and  HQ40='' "
				+ portWhereSql;// 删除字段GP20匹配hq,GP40,HQ40为空的
		errLst.add(fieldIsHqSql);
		String fieldIsEqualsSql = "delete from yf_zhengguitable where zhongDianPort = GP20 " + portWhereSql;// 删除字段GP20和zhongdianport一样的数据
		errLst.add(fieldIsEqualsSql);
		return errLst;
	}

	// yf_zhengguitable 的字段，含有GP20,GP40,HQ40
	private List<String> getFieldLst() {
		List<String> fieldLst = new ArrayList<>();
		fieldLst.add("GP20");
		fieldLst.add("GP40");
		fieldLst.add("HQ40");
		return fieldLst;
	}

	// 生成的修改美元的sql语句
	private List<String> getUsdSqlLst(String chinaPortEnName, String foreignPortEnName) {
		List<String> fieldLst = getFieldLst();
		List<String> usdSqlLst = new ArrayList<>();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		for (String field : fieldLst) {
			String beginUpperSql = "update yf_zhengguitable set " + field + "=replace(replace(" + field
					+ ",',',''),'USD','') where " + field + " like '%USD%' " + portWhereSql;// 大写USD
			String beginLowerSql = "update yf_zhengguitable  set " + field + "=replace(replace(" + field
					+ ",',',''),'usd','') where " + field + " like '%usd%' " + portWhereSql;// 小写usd
			String is$Sql = "update yf_zhengguitable  set " + field + "=replace(replace(" + field
					+ ",',',''),'$','') where " + field + " like '$%' " + portWhereSql;// $符号
			usdSqlLst.add(beginUpperSql);
			usdSqlLst.add(beginLowerSql);
			usdSqlLst.add(is$Sql);
		}
		return usdSqlLst;
	}

	// 生成转换到美元的sql语句
	private List<String> getChangeSqlLst(String chinaPortEnName, String foreignPortEnName) {
		// 目前有两种其他的货币，分别是RMB：当前汇率是0.1456，EUR：当前汇率是1.0721
		List<String> fieldLst = getFieldLst();
		List<String> changeSqlLst = new ArrayList<>();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		for (String field : fieldLst) {
			String eurSql = "update yf_zhengguitable set " + field + "=replace(replace(" + field
					+ ",',',''),'EUR','') * 1.0721 where " + field + " like '%EUR%' " + portWhereSql;
			String rmbSql = "update yf_zhengguitable set " + field + "=replace(replace(" + field
					+ ",',',''),'-RMB','') * 0.1456 where " + field + " like '%-RMB%' " + portWhereSql;
			changeSqlLst.add(eurSql);
			changeSqlLst.add(rmbSql);
		}
		return changeSqlLst;
	}

	// 生成清理逗号的sql语句
	private List<String> getClearCommaSqlLst(String chinaPortEnName, String foreignPortEnName) {
		List<String> fieldLst = getFieldLst();
		List<String> clearCommaSqlLst = new ArrayList<>();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		for (String field : fieldLst) {
			String cLSql = "update yf_zhengguitable set " + field + "=replace(" + field + ",',','') where " + field
					+ " like '%,%' " + portWhereSql;
			clearCommaSqlLst.add(cLSql);
		}
		return clearCommaSqlLst;
	}

	// 生成清理价格区间的sql语句
	private List<String> getClearIntervalSqlLst(String chinaPortEnName, String foreignPortEnName) {
		List<String> fieldLst = getFieldLst();
		List<String> clearIntervalSqlLst = new ArrayList<>();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		for (String field : fieldLst) {
			String cLSql = "update yf_zhengguitable set " + field + "=replace(" + field + ",substr(" + field
					+ ",locate('/'," + field + ")),'') where " + field + " REGEXP '^[0-9]+/' " + portWhereSql;// field字段存在如：36/50的数据
			String cLPlusSql = "update yf_zhengguitable set " + field + "= substr(" + field + ",1,locate('+'," + field
					+ ")-1)*1 + substr(" + field + ",locate('+'," + field + ")+1)*1 where " + field + " like '%+%' and "
					+ field + " regexp '[0-9]$' and " + field + " regexp '^[0-9]' " + portWhereSql;// field字段中间部分有+号的数据，如：80+35
			String cLToSql = "update yf_zhengguitable set " + field + "= substr(" + field + ",1,(locate('-'," + field
					+ ")-1)*1) where " + field + " like '%-%' and " + field + " regexp '[0-9]$' and " + field
					+ " regexp '^[0-9]' " + portWhereSql;// field字段中间部分有-号的数据，如：340-450
			clearIntervalSqlLst.add(cLSql);
			clearIntervalSqlLst.add(cLPlusSql);
			clearIntervalSqlLst.add(cLToSql);
		}
		return clearIntervalSqlLst;
	}

}
