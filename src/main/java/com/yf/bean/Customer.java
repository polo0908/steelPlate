package com.yf.bean;

import java.io.Serializable;
import java.sql.Timestamp;

public class Customer implements Serializable {

	private static final long serialVersionUID = -3096857195L;
	private int id;
	// private String companyName;
	// private String phoneNumber;
	private String email;
	private String shipping;
	private int containersNumber;
	private float weight;
	private float volume;
	private String otherService;
	private String otherComments;
	private int dealStatus;
	private Timestamp createTime;
	private String trafficType;
	private String selectRecords;
	private String lastFollowUpUserName;
	private Timestamp lastFollowUptime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getShipping() {
		return shipping;
	}

	public void setShipping(String shipping) {
		this.shipping = shipping;
	}

	public int getContainersNumber() {
		return containersNumber;
	}

	public void setContainersNumber(int containersNumber) {
		this.containersNumber = containersNumber;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public float getVolume() {
		return volume;
	}

	public void setVolume(float volume) {
		this.volume = volume;
	}

	public String getOtherService() {
		return otherService;
	}

	public void setOtherService(String otherService) {
		this.otherService = otherService;
	}

	public String getOtherComments() {
		return otherComments;
	}

	public void setOtherComments(String otherComments) {
		this.otherComments = otherComments;
	}

	public int getDealStatus() {
		return dealStatus;
	}

	public void setDealStatus(int dealStatus) {
		this.dealStatus = dealStatus;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getTrafficType() {
		return trafficType;
	}

	public void setTrafficType(String trafficType) {
		this.trafficType = trafficType;
	}

	public String getSelectRecords() {
		return selectRecords;
	}

	public void setSelectRecords(String selectRecords) {
		this.selectRecords = selectRecords;
	}

	public String getLastFollowUpUserName() {
		return lastFollowUpUserName;
	}

	public void setLastFollowUpUserName(String lastFollowUpUserName) {
		this.lastFollowUpUserName = lastFollowUpUserName;
	}

	public Timestamp getLastFollowUptime() {
		return lastFollowUptime;
	}

	public void setLastFollowUptime(Timestamp lastFollowUptime) {
		this.lastFollowUptime = lastFollowUptime;
	}

	@Override
	public String toString() {
		return "Customer [id=" + id + ", email=" + email + ", shipping=" + shipping + ", containersNumber="
				+ containersNumber + ", weight=" + weight + ", volume=" + volume + ", otherService=" + otherService
				+ ", otherComments=" + otherComments + ", dealStatus=" + dealStatus + ", createTime=" + createTime
				+ ", trafficType=" + trafficType + ", selectRecords=" + selectRecords + ", lastFollowUpUserName="
				+ lastFollowUpUserName + ", lastFollowUptime=" + lastFollowUptime + "]";
	}

}
