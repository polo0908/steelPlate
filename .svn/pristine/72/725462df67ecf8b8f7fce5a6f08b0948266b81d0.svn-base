package com.yf.spider.bean;

public class PinxiangItem {
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

	// KGS运价
	private String KGS;

	// CBM运价
	private String CBM;

	// 标题，由具体内容组成的字符串，唯一标识某条信息，用于更新操作。
	private String title;

	public PinxiangItem(String youXiaoQi, String huoDaiCompany, String chuanCompany, String qiDianPort,
			 String zhongDianPort, String qiDianRegion, String zhongDianRegion,String kGS, String cBM, String title) {
		super();
		this.youXiaoQi = youXiaoQi;
		this.huoDaiCompany = huoDaiCompany;
		this.chuanCompany = chuanCompany;
		this.qiDianPort = qiDianPort;
		this.zhongDianPort = zhongDianPort;
		this.qiDianRegion = qiDianRegion;
		this.zhongDianRegion = zhongDianRegion;
		this.KGS = kGS;
		this.CBM = cBM;
		this.title = huoDaiCompany + ',' + chuanCompany + ',' + youXiaoQi + ',' + title + ',' + kGS + ',' + cBM + ','
				+ qiDianPort + ',' + zhongDianPort;
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

	public String getKGS() {
		return KGS;
	}

	public void setKGS(String kGS) {
		KGS = kGS;
	}

	public String getCBM() {
		return CBM;
	}

	public void setCBM(String cBM) {
		CBM = cBM;
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
		System.out.print("KGS运价：" + KGS);
		System.out.println("   CBM运价：" + CBM);
		return "--------------------------------------------------------------";
	}

}
