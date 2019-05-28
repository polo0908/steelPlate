package com.yf.spider.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;

import com.yf.spider.bean.KongyunItem;
import com.yf.spider.util.DbPoolUtil;

public class KongyunDao {

	public void addKongyun(KongyunItem kyi) {
		Connection conn = DbPoolUtil.getConnection();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String insertSql = "insert into yf_kongyuntable (youXiaoQi,huoDaiCompany,"
				+ "qiDianPort,zhongDianPort,qiDianRegion,zhongDianRegion,plus45,plus100,plus300,plus500,plus1000,createTime)"
				+ " values (?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement psmt = conn.prepareStatement(insertSql);
			psmt.setString(1, kyi.getYouXiaoQi());
			psmt.setString(2, kyi.getHuoDaiCompany());
			psmt.setString(3, kyi.getQiDianPort());
			psmt.setString(4, kyi.getZhongDianPort());

			psmt.setString(5, kyi.getQiDianRegion());
			psmt.setString(6, kyi.getZhongDianRegion());

			psmt.setString(7, kyi.getPlus45());
			psmt.setString(8, kyi.getPlus100());
			psmt.setString(9, kyi.getPlus300());
			psmt.setString(10, kyi.getPlus500());
			psmt.setString(11, kyi.getPlus1000());
			psmt.setString(12, sdf.format(new Date(System.currentTimeMillis())));
			psmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			Logger logger = Logger.getLogger(KongyunDao.class);
			logger.error("spider KongyunDao addKongyun error:" + e.getMessage(), e);
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

	public void addKongyunHot(KongyunItem kyi) {
		Connection conn = DbPoolUtil.getConnection();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String insertSql = "insert into yf_kongyuntable_hot (youXiaoQi,huoDaiCompany,"
				+ "qiDianPort,zhongDianPort,qiDianRegion,zhongDianRegion,plus45,plus100,plus300,plus500,plus1000,createTime)"
				+ " values (?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement psmt = conn.prepareStatement(insertSql);
			psmt.setString(1, kyi.getYouXiaoQi());
			psmt.setString(2, kyi.getHuoDaiCompany());
			psmt.setString(3, kyi.getQiDianPort());
			psmt.setString(4, kyi.getZhongDianPort());

			psmt.setString(5, kyi.getQiDianRegion());
			psmt.setString(6, kyi.getZhongDianRegion());

			psmt.setString(7, kyi.getPlus45());
			psmt.setString(8, kyi.getPlus100());
			psmt.setString(9, kyi.getPlus300());
			psmt.setString(10, kyi.getPlus500());
			psmt.setString(11, kyi.getPlus1000());
			psmt.setString(12, sdf.format(new Date(System.currentTimeMillis())));
			psmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			Logger logger = Logger.getLogger(KongyunDao.class);
			logger.error("spider KongyunDao addKongyunHot error:" + e.getMessage(), e);
		} finally {
			DbPoolUtil.returnConnection(conn);
		}
	}

}
