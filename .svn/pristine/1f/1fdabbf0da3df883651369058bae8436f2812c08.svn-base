package com.yf.spider.dataDeal;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.yf.spider.util.DbPoolUtil;

/*
 * yf_pinxiangtable表爬虫后执行的语句 请按照顺序删除和修改数据
 */
public class PinxiangDataDeal {

	// 1.删除yf_pinxiangtable表有效期小于当前时间的数据
	public void deleteOverdue(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		String delSql = "delete from yf_pinxiangtable where youXiaoQi < sysdate() " + portWhereSql;
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

	// 2.清理yf_pinxiangtable表船公司不合理的数据。
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

	// 3.删除yf_pinxiangtable表完全重复的数据，调用mysql存储过程deal_yf_pinxiangDate_repeat
	public void deleteRepeat(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		String sql = "{CALL deal_yf_pinxiangDate_repeat('" + chinaPortEnName + "','" + foreignPortEnName + "')}"; // 调用拼箱删除重复数据的存储过程,无参数传递
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

	// 4.删除yf_pinxiangtable表不合理数据
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

	// 5.去掉yf_pinxiangtable表带有"↓","↑","USD","/RT","/TON","/CBM","$","/KG","/方","cbm","()","US"的价格数据
	public void clearDataUnit(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		List<String> clearUnitSqlLst = getClearUnitSqlLst(chinaPortEnName, foreignPortEnName);
		try {
			Statement stmt = conn.createStatement();

			for (String sql : clearUnitSqlLst) {
				stmt.execute(sql);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("clearComma执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	// 6.转换yf_pinxiangtable表其他货币单位到美元货币数据,"欧","RMB"
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

	// 7.去掉yf_pinxiangtable表带有","的价格数据
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

	// 8.清除yf_pinxiangtable表价格数据区间的数据（如：36/50）,保留/前面的数据。
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

	// 9.整理完前面的数据，删除yf_pinxiangtable表可能存在是负数和0,1的数据
	public void deleteLess(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		try {
			Statement stmt = conn.createStatement();
			String fieldIsZeroOrOneSql = "delete from yf_pinxiangtable where KGS in('0','1') or  CBM in('0','1');";// 删除字段存在为0、1的数据
			String fieldIsNegativeSql = "delete from yf_pinxiangtable where KGS like '-%'  or CBM like '-%';";// 删除字段全部为负数的数据
			String cbmLessThanTwoSql = "delete from yf_pinxiangtable where KGS regexp '^0.' or CBM regexp '^0.';";// 删除KGS和CBM字段是0.类型的数据
			stmt.execute(fieldIsZeroOrOneSql);
			stmt.execute(fieldIsNegativeSql);
			stmt.execute(cbmLessThanTwoSql);

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("deleteLess执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	// yf_pinxiangtable表船公司不合理数据集合
	private List<String> getErrorShippingSqlList(String chinaPortEnName, String foreignPortEnName) {
		List<String> errValueLst = new ArrayList<String>();
		List<String> errSqlLst = new ArrayList<String>();

		// 目前发现的不合理的字段数据，以后发现的从这里添加数据
		errValueLst.add("电联");
		errValueLst.add("电讯");
		errValueLst.add("电询");
		errValueLst.add("欢迎询价");
		errValueLst.add("ttt");
		errValueLst.add("kkk");
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		for (String errv : errValueLst) {
			String errSql = "delete from yf_pinxiangtable where chuanCompany like '%" + errv + "%' " + portWhereSql;// 采用模糊匹配模式删除
			errSqlLst.add(errSql);
		}
		String fieldIsLessSql = "delete from yf_pinxiangtable where length(chuanCompany) <2 " + portWhereSql;// 删除字段chuanCompany长度小于2的数据
		errSqlLst.add(fieldIsLessSql);
		String fieldHasNumSql = "delete from yf_pinxiangtable where chuanCompany regexp '[0-9]' " + portWhereSql;// 删除字段chuanCompany数字的，基本上是电话、手机号码和QQ的
		errSqlLst.add(fieldHasNumSql);
		String fieldIsDoubleSql = "delete from yf_pinxiangtable where (chuanCompany='ee' or chuanCompany='kk'  or chuanCompany='tt') "
				+ portWhereSql;// 删除字段chuanCompany值为"ee"、"kk"和"tt"的数据
		errSqlLst.add(fieldIsDoubleSql);
		String fieldIsHanJSql = "delete from yf_pinxiangtable where (chuanCompany='HANJIN' or chuanCompany='韩进') "
				+ portWhereSql;// 删除字段chuanCompany值为"HANJIN"和"韩进"的数据
		errSqlLst.add(fieldIsHanJSql);
		return errSqlLst;
	}

	// yf_pinxiangtable表不合理数据集合，KGS,CBM都匹配同样的数据
	private List<String> getErrorSqlList(String chinaPortEnName, String foreignPortEnName) {
		List<String> errData = new ArrayList<String>();

		errData.add("电议");
		errData.add("价格可申请");
		errData.add("电询");

		errData.add("O运费");
		errData.add("一票一议");
		errData.add("免");

		errData.add("具体咨询");
		errData.add("再议");
		errData.add("单独询价");
		errData.add("单询");

		errData.add("只做到门");
		errData.add("可申");
		errData.add("实单来询");

		errData.add("战乱停航");
		errData.add("拼箱");
		errData.add("普货");
		errData.add("暂停收货");

		errData.add("现询");
		errData.add("面议");
		errData.add("反");
		errData.add("退");
		errData.add("CASE BY");
		errData.add("续方");
		errData.add("min");
		errData.add("/bl");

		errData.add("#VALUE!");
		errData.add("1:1000");

		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		List<String> errLst = new ArrayList<String>();
		for (String errV : errData) {
			String delSql = "delete from yf_pinxiangtable where KGS like '%" + errV + "%' and CBM like '%" + errV
					+ "%';";// KGS,CBM字段匹配
			String delKGSSql = "delete from yf_pinxiangtable where KGS like '%" + errV + "%' and CBM='' "
					+ portWhereSql;// KGS字段匹配,CBM为空
			String delCBMSql = "delete from yf_pinxiangtable where KGS='' and CBM like '%" + errV + "%' "
					+ portWhereSql;// CBM字段匹配,KGS为空
			errLst.add(delSql);
			errLst.add(delKGSSql);
			errLst.add(delCBMSql);
		}
		String fieldIsNullSql = "delete from yf_pinxiangtable where KGS=''  and CBM='' " + portWhereSql;// 删除字段全部为空的数据
		errLst.add(fieldIsNullSql);
		String fieldIsNegativeSql = "delete from yf_pinxiangtable where (trim(KGS) like '-%'  or trim(CBM) like '-%') "
				+ portWhereSql;// 删除字段存在为负数的数据
		errLst.add(fieldIsNegativeSql);
		String fieldIsToLongSql = "delete from yf_pinxiangtable where (length(KGS) >10 or length(CBM) >10) "
				+ portWhereSql;// 删除字段全部为不为数字的数据
		errLst.add(fieldIsToLongSql);
		String fieldIsZeroOrOneSql = "delete from yf_pinxiangtable where KGS in('0','1') and  CBM in('0','1') "
				+ portWhereSql;// 删除字段存在为0、1的数据
		errLst.add(fieldIsZeroOrOneSql);
		String cbmEqualsZdSql = "delete from yf_pinxiangtable where zhongDianPort = CBM " + portWhereSql;// 删除字段zhongDianPort和CBM一样的数据
		errLst.add(cbmEqualsZdSql);
		String kgsqualsRatioSql = "delete from yf_pinxiangtable where KGS like '%1:1000%' " + portWhereSql;// 删除字段KGS有1:1000的数据
		errLst.add(kgsqualsRatioSql);
		return errLst;
	}

	// 生成清理数据单位的sql语句
	private List<String> getClearUnitSqlLst(String chinaPortEnName, String foreignPortEnName) {
		List<String> fieldLst = getFieldLst();
		List<String> unitLst = new ArrayList<>();
		// "↓","↑","/RT","/TON","/CBM","$","/KG","/方","cbm"可以统一处理，都是放在数据的后面的
		unitLst.add("↓");
		unitLst.add("↑");
		unitLst.add("/RT");
		unitLst.add("/TON");
		unitLst.add("/CBM");
		unitLst.add("/KG");
		unitLst.add("/方");
		unitLst.add("cbm");
		unitLst.add("KG");
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		List<String> clearUnitSqlLst = new ArrayList<>();
		for (String unitStr : unitLst) {
			for (String field : fieldLst) {
				String cLSql = "update yf_pinxiangtable set " + field + "=replace(" + field + ",'" + unitStr
						+ "','') where " + field + " like '%" + unitStr + "' " + portWhereSql;
				clearUnitSqlLst.add(cLSql);
			}
		}
		// 处理"USD"的，数据的前后都有可能
		for (String field : fieldLst) {
			String begUsdSql = "update yf_pinxiangtable set " + field + "=replace(" + field + ",'USD','') where "
					+ field + " like 'USD%' " + portWhereSql;
			String endUsdSql = "update yf_pinxiangtable set " + field + "=replace(" + field + ",'USD','') where "
					+ field + " like '%USD' " + portWhereSql;
			clearUnitSqlLst.add(begUsdSql);
			clearUnitSqlLst.add(endUsdSql);
		}
		// 处理"$"和"US"的，数据的前面
		for (String field : fieldLst) {
			String $Sql = "update yf_pinxiangtable set " + field + "=replace(" + field + ",'$','') where " + field
					+ " like '$%' " + portWhereSql;
			String usSql = "update yf_pinxiangtable set " + field + "=replace(" + field + ",'US','') where " + field
					+ " like 'US%' " + portWhereSql;
			clearUnitSqlLst.add($Sql);
			clearUnitSqlLst.add(usSql);
		}
		// 处理"()"的，有存在双重的"()"的
		for (String field : fieldLst) {
			String begSql = "update yf_pinxiangtable set " + field + "=replace(" + field + ",'(','') where " + field
					+ " like '%(%' " + portWhereSql;
			String endSql = "update yf_pinxiangtable set " + field + "=replace(" + field + ",')','') where " + field
					+ " like '%)%' " + portWhereSql;
			clearUnitSqlLst.add(begSql);
			clearUnitSqlLst.add(endSql);
		}
		return clearUnitSqlLst;
	}

	// 生成转换到美元的sql语句
	private List<String> getChangeSqlLst(String chinaPortEnName, String foreignPortEnName) {
		// 目前有两种其他的货币，分别是RMB：当前汇率是0.1456，欧：当前汇率是1.0721
		List<String> fieldLst = getFieldLst();
		List<String> changeSqlLst = new ArrayList<>();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		for (String field : fieldLst) {
			String eurSql = "update yf_pinxiangtable set " + field + "=replace(replace(" + field
					+ ",',',''),'欧','') * 1.0721 where " + field + " like '%欧%' " + portWhereSql;
			String rmbSql = "update yf_pinxiangtable set " + field + "=replace(replace(" + field
					+ ",',',''),'RMB','') * 0.1456 where " + field + " like '%RMB%' " + portWhereSql;
			String yuanSql = "update yf_pinxiangtable set " + field + "=replace(replace(" + field
					+ ",',',''),'元','') * 0.1456 where " + field + " like '%元%' " + portWhereSql;
			String $bSql = "update yf_pinxiangtable set " + field + "=replace(replace(" + field
					+ ",',',''),'$','') * 0.1456 where " + field + " like '$%' " + portWhereSql;// 美元的也一并处理了
			changeSqlLst.add(eurSql);
			changeSqlLst.add(rmbSql);
			changeSqlLst.add(yuanSql);
			changeSqlLst.add($bSql);
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
			String cLSql = "update yf_pinxiangtable set " + field + "=replace(" + field + ",',','') where " + field
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
			String cLSql = "update yf_pinxiangtable set " + field + "=replace(" + field + ",substr(" + field
					+ ",locate('/'," + field + ")),'') where " + field + " REGEXP '^[0-9]+/' " + portWhereSql;// field字段存在如：36/50的数据
			clearIntervalSqlLst.add(cLSql);
		}
		return clearIntervalSqlLst;
	}

	private List<String> getFieldLst() {
		List<String> fieldLst = new ArrayList<>();
		fieldLst.add("KGS");
		fieldLst.add("CBM");
		return fieldLst;
	}

}
