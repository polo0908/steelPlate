package com.yf.spider.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;

import com.yf.spider.bean.PinxiangItem;
import com.yf.spider.util.DbPoolUtil;

public class PinxiangDao {

	public void addPinxiang(PinxiangItem pxi) {
		Connection conn = DbPoolUtil.getConnection();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String insertSql = "insert into yf_pinxiangtable (youXiaoQi,huoDaiCompany,chuanCompany,qiDianPort,"
				+ "zhongDianPort,qiDianRegion,zhongDianRegion,KGS,CBM,createTime) values (?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement psmt = conn.prepareStatement(insertSql);

			psmt.setString(1, pxi.getYouXiaoQi());
			psmt.setString(2, pxi.getHuoDaiCompany());
			psmt.setString(3, pxi.getChuanCompany());
			psmt.setString(4, pxi.getQiDianPort());
			psmt.setString(5, pxi.getZhongDianPort());

			psmt.setString(6, pxi.getQiDianRegion());
			psmt.setString(7, pxi.getZhongDianRegion());

			psmt.setString(8, pxi.getKGS());
			psmt.setString(9, pxi.getCBM());
			psmt.setString(10, sdf.format(new Date(System.currentTimeMillis())));
			psmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			Logger logger = Logger.getLogger(PinxiangDao.class);
			logger.error("spider PinxiangDao addPinxiang error:" + e.getMessage(), e);
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	public void addPinxiangHot(PinxiangItem pxi) {
		Connection conn = DbPoolUtil.getConnection();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String insertSql = "insert into yf_pinxiangtable_hot (youXiaoQi,huoDaiCompany,chuanCompany,qiDianPort,"
				+ "zhongDianPort,qiDianRegion,zhongDianRegion,KGS,CBM,createTime) values (?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement psmt = conn.prepareStatement(insertSql);

			psmt.setString(1, pxi.getYouXiaoQi());
			psmt.setString(2, pxi.getHuoDaiCompany());
			psmt.setString(3, pxi.getChuanCompany());
			psmt.setString(4, pxi.getQiDianPort());
			psmt.setString(5, pxi.getZhongDianPort());

			psmt.setString(6, pxi.getQiDianRegion());
			psmt.setString(7, pxi.getZhongDianRegion());

			psmt.setString(8, pxi.getKGS());
			psmt.setString(9, pxi.getCBM());
			psmt.setString(10, sdf.format(new Date(System.currentTimeMillis())));
			psmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			Logger logger = Logger.getLogger(PinxiangDao.class);
			logger.error("spider PinxiangDao addPinxiangHot error:" + e.getMessage(), e);
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

}
