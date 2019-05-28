package com.yf.spider.bean;

public class ZhengguiItem {
	// 有效期
	private String youXiaoQi;

	// 货代公司
	private String huoDaiCompany;

	// 船公司
	private String chuanCompany;

	// 起点港
	private String qiDianPort;

	// 终点港
	private String zhongDianPort;

	// 起点地区
	private String qiDianRegion;

	// 终点地区
	private String zhongDianRegion;

	// 20尺柜运价
	private String GP20;

	// 40尺柜运价
	private String GP40;

	// 40尺高柜运价
	private String HQ40;

	// 标题，由具体内容组成的字符串，唯一标识某条信息，用于更新操作。
	private String title;

	public ZhengguiItem(String youXiaoQi, String huoDaiCompany, String chuanCompany, String qiDianPort,
			String zhongDianPort, String qiDianRegion, String zhongDianRegion, String gP20, String gP40, String hQ40,
			String title) {
		super();
		this.youXiaoQi = youXiaoQi;
		this.huoDaiCompany = huoDaiCompany;
		this.chuanCompany = chuanCompany;
		this.qiDianPort = qiDianPort;
		this.zhongDianPort = zhongDianPort;
		this.qiDianRegion = qiDianRegion;
		this.zhongDianRegion = zhongDianRegion;
		GP20 = gP20;
		GP40 = gP40;
		HQ40 = hQ40;
		this.title = huoDaiCompany + ',' + chuanCompany + ',' + youXiaoQi + ',' + title + ',' + gP20 + ',' + gP40 + ','
				+ hQ40 + ',' + qiDianPort + ',' + zhongDianPort;
	}

	public String getYouXiaoQi() {
		return youXiaoQi;
	}

	public void setYouXiaoQi(String youXiaoQi) {
		this.youXiaoQi = youXiaoQi;
	}

	public String getHuoDaiCompany() {
		return huoDaiCompany;
	}

	public void setHuoDaiCompany(String huoDaiCompany) {
		this.huoDaiCompany = huoDaiCompany;
	}

	public String getChuanCompany() {
		return chuanCompany;
	}

	public void setChuanCompany(String chuanCompany) {
		this.chuanCompany = chuanCompany;
	}

	public String getQiDianPort() {
		return qiDianPort;
	}

	public void setQiDianPort(String qiDianPort) {
		this.qiDianPort = qiDianPort;
	}

	public String getZhongDianPort() {
		return zhongDianPort;
	}

	public void setZhongDianPort(String zhongDianPort) {
		this.zhongDianPort = zhongDianPort;
	}

	public String getQiDianRegion() {
		return qiDianRegion;
	}

	public void setQiDianRegion(String qiDianRegion) {
		this.qiDianRegion = qiDianRegion;
	}

	public String getZhongDianRegion() {
		return zhongDianRegion;
	}

	public void setZhongDianRegion(String zhongDianRegion) {
		this.zhongDianRegion = zhongDianRegion;
	}

	public String getGP20() {
		return GP20;
	}

	public void setGP20(String gP20) {
		GP20 = gP20;
	}

	public String getGP40() {
		return GP40;
	}

	public void setGP40(String gP40) {
		GP40 = gP40;
	}

	public String getHQ40() {
		return HQ40;
	}

	public void setHQ40(String hQ40) {
		HQ40 = hQ40;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	// 设置打印格式。
	@Override
	public String toString() {
		System.out.println("--------------------------------------------------------------");
		System.out.println("标题：" + title);
		System.out.println("有效期：" + youXiaoQi);
		System.out.print("货代公司：" + huoDaiCompany);
		System.out.println("   船公司：" + chuanCompany);
		System.out.print("起点港：" + qiDianPort);
		System.out.println("   终点港：" + zhongDianPort);
		System.out.print("20尺柜运价：" + GP20);
		System.out.print("   40尺柜运价：" + GP40);
		System.out.println("   40尺高柜运价：" + HQ40);
		return "--------------------------------------------------------------";
	}

}
