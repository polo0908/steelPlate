package com.yf.spider.bean;

public class KongyunItem {
	// 有效期
	private String youXiaoQi;

	// 货代公司
	private String huoDaiCompany;

	// 起点港
	private String qiDianPort;

	// 终点港
	private String zhongDianPort;

	// 起点地区
	private String qiDianRegion;

	// 终点地区
	private String zhongDianRegion;

	// +45的运价
	private String plus45;

	// +100的运价
	private String plus100;

	// +300的运价
	private String plus300;

	// +500的运价
	private String plus500;

	// +1000的运价
	private String plus1000;

	// 标题，由具体内容组成的字符串，唯一标识某条信息，用于更新操作。
	private String title;

	public KongyunItem(String youXiaoQi, String huoDaiCompany, String qiDianPort, String zhongDianPort,
			String qiDianRegion, String zhongDianRegion, String plus45, String plus100, String plus300, String plus500,
			String plus1000, String title) {
		super();
		this.youXiaoQi = youXiaoQi;
		this.huoDaiCompany = huoDaiCompany;
		this.qiDianPort = qiDianPort;
		this.zhongDianPort = zhongDianPort;
		this.qiDianRegion = qiDianRegion;
		this.zhongDianRegion = zhongDianRegion;
		this.plus45 = plus45;
		this.plus100 = plus100;
		this.plus300 = plus300;
		this.plus500 = plus500;
		this.plus1000 = plus1000;
		this.title = huoDaiCompany + ',' + youXiaoQi + ',' + title + ',' + plus45 + ',' + plus100 + ',' + plus300 + ','
				+ plus500 + ',' + plus1000 + ',' + qiDianPort + ',' + zhongDianPort;
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

	public String getPlus45() {
		return plus45;
	}

	public void setPlus45(String plus45) {
		this.plus45 = plus45;
	}

	public String getPlus100() {
		return plus100;
	}

	public void setPlus100(String plus100) {
		this.plus100 = plus100;
	}

	public String getPlus300() {
		return plus300;
	}

	public void setPlus300(String plus300) {
		this.plus300 = plus300;
	}

	public String getPlus500() {
		return plus500;
	}

	public void setPlus500(String plus500) {
		this.plus500 = plus500;
	}

	public String getPlus1000() {
		return plus1000;
	}

	public void setPlus1000(String plus1000) {
		this.plus1000 = plus1000;
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
		System.out.println("货代公司：" + huoDaiCompany);
		System.out.print("起点港：" + qiDianPort);
		System.out.println("   终点港：" + zhongDianPort);
		System.out.print("+45运价：" + plus45);
		System.out.print("   +100运价：" + plus100);
		System.out.print("   +300运价：" + plus300);
		System.out.print("   +500运价：" + plus500);
		System.out.println("   +1000运价：" + plus1000);
		return "--------------------------------------------------------------";
	}

}
