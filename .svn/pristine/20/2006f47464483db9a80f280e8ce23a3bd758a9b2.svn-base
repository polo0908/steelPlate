package com.yf.spider.dataDeal;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.yf.spider.util.DbPoolUtil;

/*
 * yf_kongyuntable表爬虫后执行的语句 请按照顺序删除和修改数据
 */
public class KongyunDataDeal {

	// 1.删除yf_kongyuntable表有效期小于当前时间的数据
	public void deleteOverdue(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		String delSql = "delete from yf_kongyuntable where youXiaoQi < sysdate() " + portWhereSql;
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

	// 2.删除yf_kongyuntable表完全重复的数据，调用mysql存储过程deal_yf_kongyunData_repeat
	public void deleteRepeat(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		String sql = "{CALL deal_yf_kongyunData_repeat('" + chinaPortEnName + "','" + foreignPortEnName + "')}"; // 调用删除空运重复数据的存储过程,无参数传递
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

	// 3.删除yf_kongyuntable表不合理数据
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

	// 4.去掉yf_kongyuntable表带有"/KG","KG","/K"的价格数据
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
			System.out.println("clearDataUnit执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	// 5.转换yf_kongyuntable表其他货币单位到美元货币数据,"元","RMB"
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

	// 6.清除yf_kongyuntable表价格数据区间的数据（如：36/50）,保留/前面的数据。
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

	// 7.整理完前面的数据，删除yf_kongyuntable表可能存在是负数和0,1的数据
	public void deleteLess(String chinaPortEnName, String foreignPortEnName) {
		Connection conn = DbPoolUtil.getConnection();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		try {
			Statement stmt = conn.createStatement();
			String fieldIsZeroOrOneSql = "delete from yf_kongyuntable where plus45 in('0','1') and plus100 in('0','1') "
					+ "and plus300 in('0','1') and plus500 in('0','1') and plus1000 in('0','1') " + portWhereSql;// 删除字段存在为0、1的数据
			String fieldIsNegativeSql = "delete from yf_kongyuntable where (plus45 like '-%'  or plus100 like '-%' "
					+ "or plus300 like '-%' or plus500 like '-%' or plus1000 like '-%') " + portWhereSql;// 删除字段存在为负数的数据
			stmt.execute(fieldIsZeroOrOneSql);
			stmt.execute(fieldIsNegativeSql);

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("deleteLess执行失败，原因：" + e.getMessage());
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	// yf_kongyuntable表不合理数据集合，plus45,plus100,plus300,plus500,plus1000都匹配同样的数据
	private List<String> getErrorSqlList(String chinaPortEnName, String foreignPortEnName) {
		List<String> errData = new ArrayList<String>();

		errData.add("\\");
		errData.add("电询");
		errData.add("电议");
		errData.add("天");
		errData.add("AMM");
		errData.add("NIL");
		errData.add("N/A");

		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		List<String> errLst = new ArrayList<String>();
		for (String errV : errData) {
			String delSql = "delete from yf_kongyuntable where plus45 like '%" + errV + "%' and plus100 like '%" + errV
					+ "%' and plus300 like '%" + errV + "%' and plus500 like '%" + errV + "%' and plus1000 like '%"
					+ errV + "%' " + portWhereSql;// plus45,plus100,plus300,plus500,plus1000字段匹配
			errLst.add(delSql);
		}
		String fieldIsDx100Sql = "delete from yf_kongyuntable where plus45=''  and plus100='单询' and plus300='' "
				+ "and plus500='' and plus1000=''  " + portWhereSql;// 删除字段plus100单询,plus45,plus300,plus500,plus1000为空的数据
		errLst.add(fieldIsDx100Sql);
		String fieldIsDx300Sql = "delete from yf_kongyuntable where plus45=''  and plus100='' and plus300='电询' "
				+ "and plus500='' and plus1000=''  " + portWhereSql;// 删除字段plus300电询,plus45,plus100,plus500,plus1000为空的数据
		errLst.add(fieldIsDx300Sql);
		String fieldIsNull45Sql = "delete from yf_kongyuntable where plus45=''  and plus100 like '%\\\\' and plus300 like '%\\\\' "
				+ "and plus500 like '%\\\\' and plus1000 like '%\\\\' " + portWhereSql;// 删除字段plus45为空,plus100,plus300,plus500,plus1000为\的数据
		errLst.add(fieldIsNull45Sql);
		String fieldIsNullSql = "delete from yf_kongyuntable where plus45=''  and plus100='' and plus300='' "
				+ "and plus500='' " + portWhereSql;// 删除字段plus45,plus100,plus300,plus500为空的数据
		errLst.add(fieldIsNullSql);
		String fieldIsNullAllSql = "delete from yf_kongyuntable where plus45=''  and plus100='' and plus300='' "
				+ "and plus500='' " + portWhereSql;// 删除字段全部为空的数据
		errLst.add(fieldIsNullAllSql);
		String fieldIsToLongSql = "delete from yf_kongyuntable where (length(plus45) >9 or length(plus100) >9 "
				+ "or length(plus300) >9 or length(plus500) >9 or length(plus1000) >9) " + portWhereSql;// 删除字段全部为不为数字的数据
		errLst.add(fieldIsToLongSql);
		String fieldZhongdianPlus45Sql = "delete from yf_kongyuntable where zhongDianPort=plus100 " + portWhereSql;// 删除字段zhongDianPort和plus100一样的数据
		errLst.add(fieldZhongdianPlus45Sql);
		return errLst;
	}

	// 生成清理数据单位的sql语句
	private List<String> getClearUnitSqlLst(String chinaPortEnName, String foreignPortEnName) {
		List<String> fieldLst = getFieldLst();
		List<String> unitLst = new ArrayList<>();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		// "/KG","/K"可以统一处理，都是放在数据的后面的
		unitLst.add("/KG");
		unitLst.add("/K");
		unitLst.add("KG");
		List<String> clearUnitSqlLst = new ArrayList<>();
		for (String unitStr : unitLst) {
			for (String field : fieldLst) {
				String cLSql = "update yf_kongyuntable set " + field + "=replace(" + field + ",'" + unitStr
						+ "','') where " + field + " like '%" + unitStr + "' " + portWhereSql;
				clearUnitSqlLst.add(cLSql);
			}
		}
		return clearUnitSqlLst;
	}

	// 生成转换到美元的sql语句
	private List<String> getChangeSqlLst(String chinaPortEnName, String foreignPortEnName) {
		// 目前其他的货币，是RMB或元：当前汇率是0.1456、HKD港元：当前汇率是0.1289
		List<String> fieldLst = getFieldLst();
		List<String> changeSqlLst = new ArrayList<>();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		for (String field : fieldLst) {
			String YSql = "update yf_kongyuntable set " + field + "=replace(replace(" + field
					+ ",',',''),'元','') * 0.1456 where " + field + " like '%元' " + portWhereSql;
			String ZySql = "update yf_kongyuntable set " + field + "=replace(replace(" + field
					+ ",',',''),'￥','') * 0.1456 where " + field + " like '￥%' " + portWhereSql;
			String rmbSql = "update yf_kongyuntable set " + field + "=replace(replace(" + field
					+ ",',',''),'RMB','') * 0.1456 where " + field + " like '%RMB%' " + portWhereSql;
			String hkdSql = "update yf_kongyuntable set " + field + "=replace(replace(" + field
					+ ",',',''),'HKD','') * 0.1289 where " + field + " like 'HKD%' " + portWhereSql;
			changeSqlLst.add(YSql);
			changeSqlLst.add(ZySql);
			changeSqlLst.add(rmbSql);
			changeSqlLst.add(hkdSql);
		}
		return changeSqlLst;
	}

	// 生成清理价格区间的sql语句
	private List<String> getClearIntervalSqlLst(String chinaPortEnName, String foreignPortEnName) {
		List<String> fieldLst = getFieldLst();
		List<String> clearIntervalSqlLst = new ArrayList<>();
		String portWhereSql = "and ifnull(qiDianRegion,'') = '" + chinaPortEnName
				+ "' and ifnull(zhongDianRegion,'') = '" + foreignPortEnName + "';";
		for (String field : fieldLst) {
			String cLSql = "update yf_kongyuntable set " + field + "=replace(" + field + ",substr(" + field
					+ ",locate('/'," + field + ")),'') where " + field + " REGEXP '^[0-9]+/' " + portWhereSql;// field字段存在如：36/50的数据
			clearIntervalSqlLst.add(cLSql);
		}
		return clearIntervalSqlLst;
	}

	private List<String> getFieldLst() {
		List<String> fieldLst = new ArrayList<>();
		fieldLst.add("plus45");
		fieldLst.add("plus100");
		fieldLst.add("plus300");
		fieldLst.add("plus500");
		fieldLst.add("plus1000");
		return fieldLst;
	}

}
