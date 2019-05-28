package com.yf.bean;

public class QueryPortInfo {
	private String depaPortEnName;
	private String depaPortChName;
	private String depaPortAbbreviation;

	private String destPortEnName;
	private String destPortChName;
	private String destPortAbbreviation;
	private int pageNo;

	public QueryPortInfo() {

	}

	public QueryPortInfo(String destPortEnName, String destPortChName, String destPortAbbreviation) {
		super();
		this.destPortEnName = destPortEnName;
		this.destPortChName = destPortChName;
		this.destPortAbbreviation = destPortAbbreviation;
	}

	public QueryPortInfo(String destPortEnName, String destPortChName) {
		this.destPortEnName = destPortEnName;
		this.destPortChName = destPortChName;
	}

	public String getDepaPortEnName() {
		return depaPortEnName;
	}

	public void setDepaPortEnName(String depaPortEnName) {
		this.depaPortEnName = depaPortEnName;
	}

	public String getDepaPortChName() {
		return depaPortChName;
	}

	public void setDepaPortChName(String depaPortChName) {
		this.depaPortChName = depaPortChName;
	}

	public String getDestPortEnName() {
		return destPortEnName;
	}

	public void setDestPortEnName(String destPortEnName) {
		this.destPortEnName = destPortEnName;
	}

	public String getDestPortChName() {
		return destPortChName;
	}

	public void setDestPortChName(String destPortChName) {
		this.destPortChName = destPortChName;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getDepaPortAbbreviation() {
		return depaPortAbbreviation;
	}

	public void setDepaPortAbbreviation(String depaPortAbbreviation) {
		this.depaPortAbbreviation = depaPortAbbreviation;
	}

	public String getDestPortAbbreviation() {
		return destPortAbbreviation;
	}

	public void setDestPortAbbreviation(String destPortAbbreviation) {
		this.destPortAbbreviation = destPortAbbreviation;
	}

}
