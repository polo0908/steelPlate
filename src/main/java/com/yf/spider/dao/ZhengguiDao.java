package com.yf.spider.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;

import com.yf.spider.bean.ZhengguiItem;
import com.yf.spider.util.DbPoolUtil;

public class ZhengguiDao {

	public void addZhenggui(ZhengguiItem zgi) {
		Connection conn = DbPoolUtil.getConnection();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String insertSql = "insert into yf_zhengguitable (youXiaoQi,huoDaiCompany,chuanCompany,qiDianPort,"
				+ "zhongDianPort,qiDianRegion,zhongDianRegion,GP20,GP40,HQ40,createTime) values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement psmt = conn.prepareStatement(insertSql);
			psmt.setString(1, zgi.getYouXiaoQi());
			psmt.setString(2, zgi.getHuoDaiCompany());
			psmt.setString(3, zgi.getChuanCompany());
			psmt.setString(4, zgi.getQiDianPort());
			psmt.setString(5, zgi.getZhongDianPort());

			psmt.setString(6, zgi.getQiDianRegion());
			psmt.setString(7, zgi.getZhongDianRegion());

			psmt.setString(8, zgi.getGP20());
			psmt.setString(9, zgi.getGP40());
			psmt.setString(10, zgi.getHQ40());
			psmt.setString(11, sdf.format(new Date(System.currentTimeMillis())));
			psmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			Logger logger = Logger.getLogger(ZhengguiDao.class);
			logger.error("spider ZhengguiDao addZhenggui error:" + e.getMessage(), e);
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	public void addZhengguiHot(ZhengguiItem zgi) {
		Connection conn = DbPoolUtil.getConnection();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String insertSql = "insert into yf_zhengguitable_hot (youXiaoQi,huoDaiCompany,chuanCompany,qiDianPort,"
				+ "zhongDianPort,qiDianRegion,zhongDianRegion,GP20,GP40,HQ40,createTime) values (?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement psmt = conn.prepareStatement(insertSql);
			psmt.setString(1, zgi.getYouXiaoQi());
			psmt.setString(2, zgi.getHuoDaiCompany());
			psmt.setString(3, zgi.getChuanCompany());
			psmt.setString(4, zgi.getQiDianPort());
			psmt.setString(5, zgi.getZhongDianPort());

			psmt.setString(6, zgi.getQiDianRegion());
			psmt.setString(7, zgi.getZhongDianRegion());

			psmt.setString(8, zgi.getGP20());
			psmt.setString(9, zgi.getGP40());
			psmt.setString(10, zgi.getHQ40());
			psmt.setString(11, sdf.format(new Date(System.currentTimeMillis())));
			psmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			Logger logger = Logger.getLogger(ZhengguiDao.class);
			logger.error("spider ZhengguiDao addZhengguiHot error:" + e.getMessage(), e);
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

}
