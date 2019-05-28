package com.yf.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.yf.spider.util.DbPoolUtil;

public class CityTranslateUtil {
	private static List<CityInfo> cityInfos = new ArrayList<CityInfo>();

	static {
		queryCityInfos();
	}

	public static String toEnglishName(String chName) {
		if (chName == null || "".equals(chName)) {
			return "";
		}
		if (cityInfos.size() == 0) {
			queryCityInfos();
		}
		String englishname = "";
		for (CityInfo cInfo : cityInfos) {
			if (chName.indexOf(cInfo.getName()) != -1) {
				englishname = cInfo.getEnglishname();
				break;
			}
		}
		return englishname;
	}

	public static List<CityInfo> getCityInfos() {
		if (cityInfos.size() == 0) {
			queryCityInfos();
		}
		return cityInfos;
	}

	private static void queryCityInfos() {
		try {
			Connection conn = DbPoolUtil.getConnection();

			String selectSql = "select name,telnum,code,ename,englishname from yf_city_info";
			try {
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(selectSql);
				while (rs.next()) {
					CityInfo cInfo = new CityInfo();
					cInfo.setName(rs.getString("name"));
					cInfo.setTelnum(rs.getString("telnum"));
					cInfo.setCode(rs.getString("code"));
					cInfo.setEname(rs.getString("ename"));
					cInfo.setEnglishname(rs.getString("englishname"));
					cityInfos.add(cInfo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DbPoolUtil.returnConnection(conn);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
