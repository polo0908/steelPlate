function divshow(type, pageno) {
	var a = (pageno - 1) * 6;
	var preUrl = "/freight/";
	var today = new Date();
	if (type == 1) {
		var qidian = $(".combobox-item-selected").find("#aaa").text();
		var zhongdian = $(".combobox-item-selected").find("#bbb").text();
		if (qidian == null || qidian == "") {
			showNotice('The departure port can not find！');
			return;
		}
		if (zhongdian == null || zhongdian == "") {
			showNotice('The detination port can not find！');
			return;
		}
		var radioOne = false;
		$("#type1").html("");
		$("#pageCode1").html("");
		$("#searchImgDiv").show();
		$.ajax({
			type : "post",
			datatype : "json",
			url : preUrl + "getAllZhengGui.do",
			data : {
				"qidian" : $.trim(qidian),
				"zhongdian" : $.trim(zhongdian),
				"pageno" : $.trim(a.toString())
			},
			success : function(data) {
				var html = generateFclResults(data.result, today, radioOne);
				$("#type1").html(html);
				$("#pageCode1").empty();
				$("#pageCode1").createPage({
					pageCount : Math.ceil(data.total / 6),
					current : 1,
					type : type,
					qidian : qidian,
					zhongdian : zhongdian,
					backFn : function(args, pageno) {
						divChange(args, pageno);
					}
				});
				$("#searchImgDiv").hide();
			},
			error : function() {
				$("#searchImgDiv").hide();
				showNotice('The data load fails, Please try again！');
			}
		});
	} else if (type == 2) {
		var qidian = $(".combobox-item-selected").find("#ccc").text();
		var zhongdian = $(".combobox-item-selected").find("#ddd").text();
		if (qidian == null || qidian == "") {
			showNotice('The departure port can not find！');
			return;
		}
		if (zhongdian == null || zhongdian == "") {
			showNotice('The detination port can not find！');
			return;
		}
		var radioTwo = false;
		$("#type2").html("");
		$("#pageCode2").html("");
		$("#searchImgDiv").show();
		$.ajax({
			type : "post",
			datatype : "json",
			url : preUrl + "getAllPinXiang.do",
			data : {
				"qidian" : $.trim(qidian),
				"zhongdian" : $.trim(zhongdian),
				"pageno" : $.trim(a.toString())
			},
			success : function(data) {
				var html = generateLclResults(data.result, today, radioTwo);
				$("#type2").html(html);
				$("#pageCode2").empty();
				$("#pageCode2").createPage({
					pageCount : Math.ceil(data.total / 6),
					current : 1,
					type : type,
					qidian : qidian,
					zhongdian : zhongdian,
					backFn : function(args, pageno) {
						divChange(args, pageno);
					}
				});
				$("#searchImgDiv").hide();
			},
			error : function() {
				$("#searchImgDiv").hide();
				showNotice('The data load fails, Please try again！');
			}
		});
	} else if (type == 3) {
		var qidian = $(".combobox-item-selected").find("#hhh").text();
		var zhongdian = $(".combobox-item-selected").find("#fff").text();
		if (qidian == null || qidian == "") {
			showNotice('The departure port can not find！');
			return;
		}
		if (zhongdian == null || zhongdian == "") {
			showNotice('The detination port can not find！');
			return;
		}
		var radioThree = false;
		$("#type3").html("");
		$("#pageCode3").html("");

		$("#searchImgDiv").show();
		$.ajax({
			type : "post",
			datatype : "json",
			url : preUrl + "getAllKongYun.do",
			data : {
				"qidian" : $.trim(qidian),
				"zhongdian" : $.trim(zhongdian),
				"pageno" : $.trim(a.toString()),
			},
			success : function(data) {
				var html = generateAirResults(data.result, today, radioThree);
				$("#type3").html(html);
				$("#pageCode3").empty();
				$("#pageCode3").createPage({
					pageCount : Math.ceil(data.total / 6),
					current : 1,
					type : type,
					qidian : qidian,
					zhongdian : zhongdian,
					backFn : function(args, pageno) {
						divChange(args, pageno);
					}
				});
				$("#searchImgDiv").hide();
			},
			error : function() {
				$("#searchImgDiv").hide();
				showNotice('The data load fails, Please try again！');
			}
		});
	} else if (type == 4) {
		var zong = 1;
		var kg = 1;
		var cbmkg = 1;
		var countryid = $(".combobox-item-selected").find("#iii").text();
		var kgs = $("#jj").numberbox("getValue");// 搜索框的值kg
		var cbm = $("#qq").numberbox("getValue");// 搜索框中的值cbm
		var kuaiyoukg = $("#kuaiyoukg option:selected");// 下拉框中的文本
		var kuaiyoucbm = $("#kuaiyoulb option:selected");// 下拉框中的文本
		if (countryid != "" && countryid != null) {
			if (kgs == "" || kgs == null || cbm == null || cbm == "") {
				if (kgs == "" || kgs == null) {
					showNotice('Weight cannot be empty！');
				} else if (cbm == null || cbm == "") {
					showNotice('Volume cannot be empty！');
				}
			} else {
				if (isNaN(kgs) || isNaN(cbm)) {
					if (isNaN(kgs)) {
						showNotice('Weight is not all numbers！');
					} else if (isNaN(cbm)) {
						showNotice('Volume is not all numbers！');
					}
				} else {
					if (kuaiyoukg.text() == "KG") {
						kg = kgs * 1;
					} else {
						kg = kgs * 0.45359237;
					}
					if (kuaiyoucbm.text() == "CBM") {
						cbmkg = cbm * 1;
					} else {
						cbmkg = cbm * 0.028316846592;
					}
					var radioFour = false;
					$("#type4").html("");

					$("#searchImgDiv").show();
					$
							.ajax({
								type : "post",
								url : preUrl + "kuaYuQingQiu.do",
								datatype : "json",
								data : {
									"countryid" : countryid,
									"weight" : kg,
									"volume" : cbmkg,
								},
								success : function(data) {
									if (data.length != 0) {
										var html = generateExpResults(
												eval(data), radioFour);
										$("#type4").html(html);
										$("#showEmpty").hide();
									} else {
										$("#showEmpty").show();
									}
									$("#searchImgDiv").hide();
								},
								error : function() {
									$("#searchImgDiv").hide();
									showNotice('The data load fails, Please try again！');
								}
							});
				}
			}
		} else {
			showNotice('The detination country  can not find！');
		}
	}
}

function divChange(args, pageno) {
	var a = (pageno - 1) * 6;
	var preUrl = "/freight/";
	var today = new Date();
	if (args.type == 1) {
		var radioOne = false;
		$("#searchImgDiv").show();
		$.ajax({
			type : "post",
			datatype : "json",
			url : preUrl + "getAllZhengGui.do",
			data : {
				"qidian" : $.trim(args.qidian),
				"zhongdian" : $.trim(args.zhongdian),
				"pageno" : $.trim(a.toString())
			},
			success : function(data) {
				var html = generateFclResults(data.result, today, radioOne);
				$("#type1").html("");
				$("#type1").html(html);
				if (data.pageNo != a) {
					$("#pageCode1").empty();
					$("#pageCode1").createPage({
						pageCount : Math.ceil(data.total / 6),
						current : 1,
						type : args.type,
						qidian : args.qidian,
						zhongdian : args.zhongdian,
						backFn : function(args, pageno) {
							divChange(args, pageno);
						}
					});
				}
				$("#searchImgDiv").hide();
			},
			error : function() {
				$("#searchImgDiv").hide();
				showNotice('The data load fails, Please try again！');
			}
		});
	} else if (args.type == 2) {
		var radioTwo = false;
		$("#searchImgDiv").show();
		$.ajax({
			type : "post",
			datatype : "json",
			url : preUrl + "getAllPinXiang.do",
			data : {
				"qidian" : $.trim(args.qidian),
				"zhongdian" : $.trim(args.zhongdian),
				"pageno" : $.trim(a.toString())
			},
			success : function(data) {
				var html = generateLclResults(data.result, today, radioTwo);
				$("#type2").html("");
				$("#type2").html(html);
				if (data.pageNo != a) {
					$("#pageCode2").empty();
					$("#pageCode2").createPage({
						pageCount : Math.ceil(data.total / 6),
						current : 1,
						type : args.type,
						qidian : args.qidian,
						zhongdian : args.zhongdian,
						backFn : function(args, pageno) {
							divChange(args, pageno);
						}
					});
				}
				$("#searchImgDiv").hide();
			},
			error : function() {
				$("#searchImgDiv").hide();
				showNotice('The data load fails, Please try again！');
			}
		});
	} else if (args.type == 3) {
		var radioThree = false;
		$("#searchImgDiv").show();
		$.ajax({
			type : "post",
			datatype : "json",
			url : preUrl + "getAllKongYun.do",
			data : {
				"qidian" : $.trim(args.qidian),
				"zhongdian" : $.trim(args.zhongdian),
				"pageno" : $.trim(a.toString()),
			},
			success : function(data) {
				var html = generateAirResults(data.result, today, radioThree);
				$("#type3").html("");
				$("#type3").html(html);
				if (data.pageNo != a) {
					$("#pageCode3").empty();
					$("#pageCode3").createPage({
						pageCount : Math.ceil(data.total / 6),
						current : 1,
						type : args.type,
						qidian : args.qidian,
						zhongdian : args.zhongdian,
						backFn : function(args, pageno) {
							divChange(args, pageno);
						}
					});
				}
				$("#searchImgDiv").hide();
			},
			error : function() {
				$("#searchImgDiv").hide();
				showNotice('The data load fails, Please try again！');
			}
		});
	}
}

function divHotChange(args, pageno) {
	var a = (pageno - 1) * 6;
	var preUrl = "/freight/";
	var today = new Date();
	if (args.type == 1) {
		$("#type1").html("");
		var radioOne = false;
		$("#searchImgDiv").show();
		$.ajax({
			type : "post",
			datatype : "json",
			data : {
				"pageno" : $.trim(a.toString())
			},
			url : preUrl + "getZxHotPortList.do",
			success : function(data) {
				var html = generateFclResults(data.result, today, radioOne);
				$("#type1").html(html);
				$("#searchImgDiv").hide();
			},
			error : function() {
				$("#searchImgDiv").hide();
				showNotice('The data load fails, Please try again！');
			}
		});
	} else if (args.type == 2) {
		$("#type2").html("");
		var radioTwo = false;

		$("#searchImgDiv").show();
		$.ajax({
			type : "post",
			datatype : "json",
			url : preUrl + "getPxHotPortList.do",
			data : {
				"pageno" : $.trim(a.toString())
			},
			success : function(data) {
				var html = generateLclResults(data.result, today, radioTwo);
				$("#type2").html(html);
				$("#searchImgDiv").hide();
			},
			error : function() {
				$("#searchImgDiv").hide();
				showNotice('The data load fails, Please try again！');
			}
		});

	} else if (args.type == 3) {
		$("#type3").html("");
		var radioThree = false;
		$("#searchImgDiv").show();
		$.ajax({
			type : "post",
			datatype : "json",
			url : preUrl + "getHotKongYun.do",
			data : {
				"pageno" : $.trim(a.toString()),
			},
			success : function(data) {
				var html = generateAirResults(data.result, today, radioThree);
				$("#type3").html("");
				$("#type3").html(html);
				$("#searchImgDiv").hide();
			},
			error : function() {
				$("#searchImgDiv").hide();
				showNotice('The data load fails, Please try again！');
			}
		});
	}
}

function generateFclResults(json, today, radioOne) {
	var html = "";
	$
			.each(
					json,
					function(index, item) {
						var youxiaoqi = json[index].youxiaoqi;
						html += "<div class='visible-on visione'>";
						html += "<p class='colname con-bj'><em style='margin-left:3%;font-style: initial;'>"
								+ "period of validity:</em><span style='float:left;width:100px;color: rgba(10, 25, 160, 0.98)'>";
						if ((youxiaoqi.time - today.getTime()) > 2592000000) {
							html += "A month later";
						} else {
							html += new Date(youxiaoqi.time)
									.toLocaleDateString();
						}
						html += " </span></p>";
						html += "<div class='visible-le'><div class='visible-qi'><b class='visible-qib1'>FROM</b><span title='"
								+ item.qidianport
								+ "'>"
								+ item.qidianport
								+ "</span></div>"
								+ "<div class='visible-qi'><b class='visible-qib2'>TO</b><span title='"
								+ item.zhongdianport
								+ "'>"
								+ item.zhongdianport + "</span></div></div>";

						html += "<div class='visible-left'>";

						var gp20Val = "";
						var gp40Val = "";
						var hq40Val = "";

						if (radioOne) {
							html += "<p><span class='headline-show'>20GP</span> <span>";
							if (!(parseFloat(item.gp20).toString() == "NaN")) {
								gp20Val = (Number(item.gp20) + 350).toFixed(2)
										+ " USD";
								html += gp20Val;
							} else {
								gp20Val = "--";
								html += gp20Val;
							}
							html += "</span><p class='bains'>";
							html += "<span class='headline-show'>40GP</span> <span>";
							if (!(parseFloat(item.gp40).toString() == "NaN")) {
								gp40Val = (Number(item.gp40) + 350).toFixed(2)
										+ " USD";
								html += gp40Val;
							} else {
								gp40Val = "--";
								html += gp40Val;
							}
							html += "</span></p><p>";
							html += "<span class='headline-show'>40HQ</span> <span>";
							if (!(parseFloat(item.hq40).toString() == "NaN")) {
								hq40Val = (Number(item.hq40) + 350).toFixed(2)
										+ " USD";
								html += hq40Val;
							} else {
								hq40Val = "--";
								html += "--";
							}
							html += "</span></p></div><div class='visible-right'>";
						} else {
							html += "<p><span class='headline-show'>20GP</span> <span>";
							if (!(parseFloat(item.gp20).toString() == "NaN")) {
								gp20Val = item.gp20 + " USD";
								html += gp20Val;
							} else {
								gp20Val = "--";
								html += gp20Val;
							}
							html += "</span><p class='bains'>";
							html += "<span class='headline-show'>40GP</span> <span>";
							if (!(parseFloat(item.gp40).toString() == "NaN")) {
								gp40Val = item.gp40 + " USD";
								html += gp40Val;
							} else {
								gp40Val = "--";
								html += gp40Val;
							}
							html += "</span></p><p>";
							html += "<span class='headline-show'>40HQ</span> <span>";
							if (!(parseFloat(item.hq40).toString() == "NaN")) {
								hq40Val += item.hq40 + " USD";
								html += hq40Val;
							} else {
								hq40Val = "--";
								html += hq40Val;
							}
							html += "</span></p></div><div class='visible-right'>";
						}
						html += "<p class='right-p'>" + item.chuancompany
								+ "</p></div>";
						html += "<div class='jump_but'><button onclick=\"fclToContactus('"
								+ item.qidianport
								+ "','"
								+ item.zhongdianport
								+ "','"
								+ item.huodaicompany
								+ "','"
								+ gp20Val
								+ "','"
								+ gp40Val
								+ "','"
								+ hq40Val
								+ "',"
								+ youxiaoqi.time
								+ ",'"
								+ item.chuancompany
								+ "')\">Contact Us</button></div></div>";

					});
	return html;
}

function generateLclResults(listPinXiang, today, radioTwo) {
	var html = "";
	for (var k = 0; k < listPinXiang.length; k++) {
		html += "<div class='visible-on visione' type='hidden'>";
		html += "<p class='colname con-bj'><em style='margin-left:3%;font-style: initial;'>"
				+ "period of validity:</em><span style='float:left;width:100px;color: rgba(10, 25, 160, 0.98)'>";
		if ((listPinXiang[k].youxiaoqi.time - today.getTime()) > 2592000000) {
			html += "A month later";
		} else {
			html += new Date(listPinXiang[k].youxiaoqi.time)
					.toLocaleDateString();
		}
		html += " </span></p>";
		html += "<div class='visible-le'><div class='visible-qi'><b class='visible-qib1'>FROM</b><span title='"
				+ listPinXiang[k].qidianport
				+ "'>"
				+ listPinXiang[k].qidianport
				+ "</span></div>"
				+ "<div class='visible-qi'><b class='visible-qib2'>TO</b><span title='"
				+ listPinXiang[k].zhongdianport
				+ "'>"
				+ listPinXiang[k].zhongdianport + "</span></div></div>";

		html += "<div class='visible-left'>";
		var kgsVal = "";
		var cbmVal = "";

		if (radioTwo) {
			html += "<p class='bains'><span class='headline-show'>TONS</span> <span>";
			if (!(parseFloat(listPinXiang[k].kgs).toString() == "NaN")) {
				kgsVal = (Number(listPinXiang[k].kgs) + 350).toFixed(2)
						+ " USD";
				html += kgsVal;
			} else {
				kgsVal = "--";
				html += "--";
			}
			html += "</span></p>";
			html += "<p class='bains'><span class='headline-show'>CBM</span> <span>";
			if (!(parseFloat(listPinXiang[k].cbm).toString() == "NaN")) {
				cbmVal = (Number(listPinXiang[k].cbm) + 350).toFixed(2)
						+ " USD";
				html += cbmVal;
			} else {
				cbmVal = "--";
				html += "--";
			}
			html += "</span></p>";
		} else {
			html += "<p class='bains'><span class='headline-show'>TONS</span> <span>";
			if (!(parseFloat(listPinXiang[k].kgs).toString() == "NaN")) {
				kgsVal = Number(listPinXiang[k].kgs).toFixed(2) + " USD";
				html += kgsVal;
			} else {
				kgsVal = "--";
				html += "--";
			}
			html += "</span></p>";
			html += "<p class='bains'><span class='headline-show'>CBM</span> <span>";
			if (!(parseFloat(listPinXiang[k].cbm).toString() == "NaN")) {
				cbmVal = Number(listPinXiang[k].cbm).toFixed(2) + " USD";
				html += cbmVal;
			} else {
				cbmVal = "--";
				html += "--";
			}
			html += "</span></p>";
		}

		html += "</div><div class='visible-right'>";
		html += "</p><p class='right-p'>" + listPinXiang[k].chuancompany
				+ "</p></div>";
		html += "<div class='jump_but'><button onclick=\"lclToContactus('"
				+ listPinXiang[k].qidianport + "','"
				+ listPinXiang[k].zhongdianport + "','"
				+ listPinXiang[k].huodaicompany + "','" + kgsVal + "','"
				+ cbmVal + "'," + listPinXiang[k].youxiaoqi.time + ",'"
				+ listPinXiang[k].chuancompany
				+ "')\">Contact Us</button></div></div>";

	}
	return html;
}

function generateAirResults(json, today, radioThree) {
	var html = "";
	$
			.each(
					json,
					function(index, item) {
						var youxiaoqi = item.youxiaoqi;
						html += "<div class='visible-on visione'>";
						html += "<p class='colname con-bj'><em style='margin-left:3%;font-style: initial;'>"
								+ "period of validity:</em><span style='float:left;width:100px;color: rgba(10, 25, 160, 0.98)'>";
						if ((youxiaoqi.time - today.getTime()) > 2592000000) {
							html += "A month later";
						} else {
							html += new Date(youxiaoqi.time)
									.toLocaleDateString();
						}
						html += " </span></p>";
						html += "<div class='visible-le visible-le1'><div class='visible-qi'><b class='visible-qib1'>FROM</b><span title='"
								+ item.qidianport
								+ "'>"
								+ item.qidianport
								+ "</span></div>"
								+ "<div class='visible-qi'><b class='visible-qib2'>TO</b><span title='"
								+ item.zhongdianport
								+ "'>"
								+ item.zhongdianport + "</span></div></div>";

						html += "<div class='visible-left visible-left1'>";

						var plus45Val = "";
						var plus100Val = "";
						var plus300Val = "";
						var plus500Val = "";
						var plus1000Val = "";

						if (radioThree) {
							html += "<p><span class='headline-show'>+45</span> <span>";
							if (!(parseFloat(item.plus45).toString() == "NaN")) {
								plus45Val = (Number(item.plus45) + 350)
										.toFixed(2)
										+ " USD/KG";
								html += plus45Val;
							} else {
								plus45Val = "--";
								html += "--";
							}

							html += "</span><p class='bains'>";
							html += "<span class='headline-show'>+100</span> <span>";
							if (!(parseFloat(item.plus100).toString() == "NaN")) {
								plus100Val = (Number(item.plus100) + 350)
										.toFixed(2)
										+ " USD/KG";
								html += plus100Val;
							} else {
								plus100Val = "--";
								html += "--";
							}
							html += "</span></p>";
							html += "<P><span class='headline-show'>+300</span> <span>";
							if (!(parseFloat(item.plus300).toString() == "NaN")) {
								plus300Val = (Number(item.plus300) + 350)
										.toFixed(2)
										+ " USD/KG";
								html += plus300Val;
							} else {
								plus300Val = "--";
								html += "--";
							}
							html += "</span></P>";
							html += "<P><span class='headline-show'>+500</span> <span>";
							if (!(parseFloat(item.plus500).toString() == "NaN")) {
								plus500Val = (Number(item.plus500) + 350)
										.toFixed(2)
										+ " USD/KG";
								html += plus500Val;
							} else {
								plus500Val = "--";
								html += "--";
							}
							html += "</span></P>";
							html += "<P><span class='headline-show'>+1000</span> <span>";
							if (!(parseFloat(item.plus1000).toString() == "NaN")) {
								plus1000Val = (Number(item.plus1000) + 350)
										.toFixed(2)
										+ " USD/KG";
								html += plus1000Val;
							} else {
								plus1000Val = "--";
								html += "--";
							}
							html += "</span></P></div><div class='visible-right'>";
						} else {
							html += "<p><span class='headline-show'>+45</span> <span>";
							if (!(parseFloat(item.plus45).toString() == "NaN")) {
								plus45Val = Number(item.plus45).toFixed(2)
										+ " USD/KG";
								html += plus45Val;
							} else {
								plus45Val = "--";
								html += plus45Val;
							}

							html += "</span><p class='bains'>";
							html += "<span class='headline-show'>+100</span> <span>";
							if (!(parseFloat(item.plus100).toString() == "NaN")) {
								plus100Val = Number(item.plus100).toFixed(2)
										+ " USD/KG";
								html += plus100Val;
							} else {
								plus100Val = "--";
								html += plus100Val;
							}

							html += "</span></p>";
							html += "<P><span class='headline-show'>+300</span> <span>";
							if (!(parseFloat(item.plus300).toString() == "NaN")) {
								plus300Val = Number(item.plus300).toFixed(2)
										+ " USD/KG";
								html += plus300Val;
							} else {
								plus300Val = "--";
								html += plus300Val;
							}

							html += "</span></P>";
							html += "<P><span class='headline-show'>+500</span> <span>";
							if (!(parseFloat(item.plus500).toString() == "NaN")) {
								plus500Val = Number(item.plus500).toFixed(2)
										+ " USD/KG";
								html += plus500Val;
							} else {
								plus500Val = "--";
								html += plus500Val;
							}

							html += "</span></P>";
							html += "<P><span class='headline-show'>+1000</span> <span>";
							if (!(parseFloat(item.plus1000).toString() == "NaN")) {
								plus1000Val = Number(item.plus1000).toFixed(2)
										+ " USD/KG";
								html += plus1000Val;
							} else {
								plus1000Val = "--";
								html += plus1000Val;
							}
							html += "</span></P></div><div class='visible-right'>";
						}

						html += "<div class='jump_but' style='margin-top:10px'><button onclick=\"airToContactus('"
								+ item.qidianport
								+ "','"
								+ item.zhongdianport
								+ "','"
								+ item.huodaicompany
								+ "','"
								+ plus45Val
								+ "','"
								+ plus100Val
								+ "','"
								+ plus300Val
								+ "','"
								+ plus500Val
								+ "','"
								+ plus1000Val
								+ "',"
								+ youxiaoqi.time
								+ ")\">Contact Us</button></div></div></div>";
					});
	return html;
}

function generateExpResults(json, radioFour) {
	var html = "";
	$
			.each(
					json,
					function(index, item) {
						html += "<div class='visible-on visione'>";

						html += "<p class='colname con-bj'><em style='margin-left:3%;font-style: initial;font-size: 14px;'>international shipping time:</em><span style='float:left;width:100px;color: rgba(10, 25, 160, 0.98)'>"
								+ item.days + " days </span></p>";
						html += "<div class='visible-le'><div class='visible-qi'><span style='font-size: 16px;font-weight:bold;'>";
						if (item.name == 35) {
							html += "IMExpress Plus";
						} else {
							html += item.name;
						}
						html += "</span></div></div>";

						html += "<div class='visible-left'>";
						if (radioFour) {
							html += "<p><span style=' padding-top: 10px;'>"
									+ (Number(item.result) + 350).toFixed(2)
									+ " USD" + "</span><p class='bains'>";
						} else {
							html += "<p><span style=' padding-top: 10px;'>"
									+ item.result + " USD"
									+ "</span><p class='bains'>";
						}

						html += "</div><div class='visible-right'>";
						html += "<div class='jump_but' style='margin-top:10px'><button onclick=\"expToContactus('"
								+ item.name
								+ "','"
								+ item.result
								+ "','"
								+ item.days
								+ "')\">Contact Us</button></div></div></div></div>";

					});
	return html;
}

function fclToContactus(qidianport, zhongdianport, huodaicompany, gp20, gp40,
		hq40, validityDate, shippingCompany) {
	var date = new Date(validityDate);
	var trafficType = "fcl";
	var showRecords = '<div class="vali-top"><div class="vali-top1"><b>ValidityDate:</b><span>'
			+ date.toLocaleDateString()
			+ ',</span></div><div class="vali-top2"><b>ShippingCompany:</b><span>'
			+ shippingCompany
			+ '</span></div></div>'
			+ '<div class="vali-left"><div class="vali-le1 visible-qi"><b class="visible-qib1">FR:</b><span>'
			+ qidianport
			+ '</span></div>'
			+ '<div class="vali-le2 visible-qi"><b class="visible-qib2">TO:</b><span>'
			+ zhongdianport
			+ '</div></div>'
			+ '<div class="vali-right"><div class="vali-ri1"><b>GP20:</b><span>'
			+ gp20
			+ '</span></div><div class="vali-ri2"><b>GP40:</b><span>'
			+ gp40
			+ '</span></div><div class="vali-ri3"><b>HQ40:</b><span>'
			+ hq40 + '</div></div>';
	var selectRecords = "HuoDaiCompany:" + huodaicompany + ',QiDianPort:'
			+ qidianport + ',ZhongDianPort:' + zhongdianport + ',GP20:' + gp20
			+ ',GP40:' + gp40 + ',HQ40:' + hq40 + ',ValidityDate:'
			+ date.toLocaleDateString() + ',ShippingCompany:' + shippingCompany;

	saveAndJump(trafficType, showRecords, selectRecords);

}
function lclToContactus(qidianport, zhongdianport, huodaicompany, kgs, cbm,
		validityDate, shippingCompany) {
	var date = new Date(validityDate);
	var trafficType = "lcl";
	var showRecords = "";
	var selectRecords = "";

	showRecords = '<div class="vali-top"><div class="vali-top1"><b>ValidityDate:</b><span>'
			+ date.toLocaleDateString()
			+ '</span></div><div class="vali-top2"><b>ShippingCompany:</b><span>'
			+ shippingCompany
			+ '</span></div></div>'
			+ '<div class="vali-left"><div class="vali-le1 visible-qi"><b class="visible-qib1">FR:</b><span>'
			+ qidianport
			+ '</span></div>'
			+ '<div class="vali-le2 visible-qi"><b class="visible-qib2">TO:</b><span>'
			+ zhongdianport
			+ '</div></div>'
			+ '<div class="vali-right"><div class="vali-ri1"><b>TONS:</b><span>'
			+ kgs
			+ '</span></div><div class="vali-ri2"><b>CBM:</b><span>'
			+ cbm + '</span></div></div>';
	selectRecords = 'HuoDaiCompany:' + huodaicompany + ',QiDianPort:'
			+ qidianport + ',ZhongDianPort:' + zhongdianport + ',KGS:' + kgs
			+ ',CBM:' + cbm + ',ValidityDate:' + date.toLocaleDateString()
			+ ',ShippingCompany:' + shippingCompany;
	saveAndJump(trafficType, showRecords, selectRecords);

}
function airToContactus(qidianport, zhongdianport, huodaicompany, plus45,
		plus100, plus300, plus500, plus1000, validityDate) {
	var date = new Date(validityDate);
	var trafficType = "air";
	var showRecords = '<div class="vali-top"><div class="vali-top1"><b>ValidityDate:</b><span>'
			+ date.toLocaleDateString()
			+ '</span></div></div>'
			+ '<div class="vali-left vali-left3"><div class="vali-le1 visible-qi"><b class="visible-qib1">FR:</b><span>'
			+ qidianport
			+ '</span></div>'
			+ '<div class="vali-le2 visible-qi"><b class="visible-qib2">TO:</b><span>'
			+ zhongdianport
			+ '</div></div>'
			+ '<div class="vali-right vali-right3"><div class="vali-ri-1"><b>PLUS45:</b><span>'
			+ plus45
			+ '</span></div><div class="vali-ri-2"><b>PLUS100:</b><span>'
			+ plus100
			+ '</span></div><div class="vali-ri-3"><b>PLUS300:</b><span>'
			+ plus300
			+ '</span></div><div class="vali-ri-4"><b>PLUS500:</b><span>'
			+ plus500
			+ '</span></div><div class="vali-ri-5"><b>PLUS1000:</b><span>'
			+ plus1000 + '</div></div>';

	var selectRecords = "HuoDaiCompany:" + huodaicompany + ',QiDianPort:'
			+ qidianport + ',ZhongDianPort:' + zhongdianport + ',PLUS45:'
			+ plus45 + ',PLUS100:' + plus100 + ',PLUS300:' + plus300
			+ ',PLUS500:' + plus500 + ',PLUS1000:' + plus1000
			+ ',ValidityDate:' + date.toLocaleDateString();

	saveAndJump(trafficType, showRecords, selectRecords);

}
function expToContactus(name, result, days) {
	var country = $("#ii").combobox('getText');
	var trafficType = "exp";
	var showRecords = '<div class="vali-top"><div class="vali-top1"><b>InternationalShippingTime:</b><span>'
			+ days
			+ 'Days</span></div><div class="vali-top2"><b>TypeOfTraffic:</b><span>';
	if (name == '35') {
		showRecords += "IMExpress Plus";
	} else {
		showRecords += name;
	}
	showRecords += '</span></div></div>'
			+ '<div class="vali-left"><div class="vali-le2 visible-qi" style="margin-top: 10px;"><b class="visible-qib2">TO:</b><span>'
			+ country
			+ '</div></div>'
			+ '<div class="vali-right"><div class="vali-ri1"><b>Price:</b><span>'
			+ result + ' USD</span></div></div>';

	var selectRecords = "Country:" + country + ',TypeOfTraffic:';
	if (name == '35') {
		selectRecords += "IMExpress Plus";
	} else {
		selectRecords += name;
	}
	selectRecords += ',Price:' + result + ',InternationalShippingTime:' + days
			+ ' Days';
	saveAndJump(trafficType, showRecords, selectRecords);

}

function changePageGro(type) {
	var sessionStorage = window.sessionStorage;
	$("#showEmpty").hide();
	$("#type1").hide();
	$("#type2").hide();
	$("#type3").hide();
	$("#type4").hide();
	$("#pageCode1").hide();
	$("#pageCode2").hide();
	$("#pageCode3").hide();
	switch (type) {
	case 1:
		if (fclDeparturePort.length == 0 || fclDestinationPort.length == 0) {
			loadFclData();
		}
		$("#type1").show();
		$("#pageCode1").show();
		sessionStorage.setItem("trafficType", "fcl");
		break;
	case 2:
		if (lclDeparturePort.length == 0 || lclDeparturePort.length == 0) {
			loadLclData();
		}
		$("#type2").show();
		$("#pageCode2").show();
		sessionStorage.setItem("trafficType", "lcl");
		break;
	case 3:
		if (kongyunDoctorData.length == 0 || kongyunDoctorData.length == 0) {
			loadAirData();
		}
		$("#type3").show();
		$("#pageCode3").show();
		sessionStorage.setItem("trafficType", "air");
		break;
	case 4:
		if (kuaiyunData.length == 0) {
			loadExpData();
		}
		$("#type4").show();
		sessionStorage.setItem("trafficType", "exp");
		break;
	}
	$("#pageCode").empty();
}

function loadFclData() {
	$("#loadImgDiv").show();
	var preUrl = "/freight/";
	var today = new Date();
	// 整箱海运起始港口
	$.ajax({
		type : "post",
		async : false,
		datatype : "json",
		url : preUrl + "queryFclDeparturePort.do",
		success : function(data) {
			fclDeparturePort = data;
			$("#aa").combobox("loadData", data);
			$("#aa").combobox("select", "SHANGHAI");
		},
		error : function() {
			$("#loadImgDiv").hide();
			showNotice('The data load fails, please refresh the page again！');
		}
	});

	// 整箱海运目的港口
	$.ajax({
		type : "post",
		async : false,
		datatype : "json",
		url : preUrl + "queryFclDestinationPort.do",
		success : function(data) {
			fclDestinationPort = data;
			$("#bb").combobox("loadData", data);
		},
		error : function() {
			$("#loadImgDiv").hide();
			showNotice('The data load fails, please refresh the page again！');
		}
	});

	// 整箱海运热门港口数据获取
	$.ajax({
		type : "post",
		async : false,
		datatype : "json",
		data : {
			"pageno" : "0"
		},
		url : preUrl + "getZxHotPortList.do",
		success : function(data) {
			var html = generateFclResults(data.result, today, false);
			$("#type1").empty();
			$("#type1").html(html);
			$("#pageCode1").empty();
			$("#pageCode1").show();
			$("#pageCode1").createPage({
				pageCount : Math.ceil(data.total / 6),
				current : 1,
				type : 1,
				backFn : function(args, pageno) {
					divHotChange(args, pageno);
				}
			});

		},
		error : function() {
			$("#loadImgDiv").hide();
			showNotice('Network anomaly！');
		}
	});
	$("#loadImgDiv").hide();
}

function loadLclData() {
	$("#loadImgDiv").show();
	var preUrl = "/freight/";
	var today = new Date();
	// 拼箱海运起始港口
	$.ajax({
		type : "post",
		async : false,
		datatype : "json",
		url : preUrl + "queryLclDeparturePort.do",
		success : function(data) {
			lclDeparturePort = data;
			$("#cc").combobox("loadData", data);
			$("#cc").combobox("select", "SHANGHAI");
		},
		error : function() {
			$("#loadImgDiv").hide();
			showNotice('The data load fails, please refresh the page again！');
		}
	});

	// 拼箱海运目的港口
	$.ajax({
		type : "post",
		async : false,
		datatype : "json",
		url : preUrl + "queryLclDestinationPort.do",
		success : function(data) {
			lclDestinationPort = data;
			$("#dd").combobox("loadData", data);
		},
		error : function() {
			$("#loadImgDiv").hide();
			showNotice('The data load fails, please refresh the page again！');
		}
	});

	// 拼箱海运热门港口数据获取

	$.ajax({
		type : "post",
		async : false,
		datatype : "json",
		data : {
			"pageno" : "0"
		},
		url : preUrl + "getPxHotPortList.do",
		success : function(data) {
			var html = generateLclResults(data.result, today, false);
			$("#type2").html(html);
			$("#pageCode2").empty();
			$("#pageCode2").hide();
			$("#pageCode2").createPage({
				pageCount : Math.ceil(data.total / 6),
				current : 1,
				type : 2,
				backFn : function(args, pageno) {
					divHotChange(args, pageno);
				}
			});
		},
		error : function() {
			$("#loadImgDiv").hide();
			showNotice('The data load fails, please refresh the page again！');
		}
	});
	$("#loadImgDiv").hide();
}

function loadAirData() {
	$("#loadImgDiv").show();
	var preUrl = "/freight/";
	var today = new Date();
	// 空运起始港口
	$.ajax({
		type : "post",
		async : false,
		datatype : "json",
		url : preUrl + "ajaxQiDian.do",
		data : {
			"doctor_name" : ""
		},
		success : function(data) {
			kongyunDoctorData = data;
			$("#hh").combobox("loadData", data);
			$("#hh").combobox("select", "PVG");
		},
		error : function() {
			$("#loadImgDiv").hide();
			showNotice('The data load fails, please refresh the page again！');
		}
	});

	// 空运目的港口
	$.ajax({
		type : "post",
		async : false,
		datatype : "json",
		url : preUrl + "ajaxKongYunName.do",
		data : {
			"doctor_name" : ""
		},
		success : function(data) {
			kongyunDesData = data;
			$("#ff").combobox("loadData", data);
		},
		error : function() {
			$("#loadImgDiv").hide();
			showNotice('The data load fails, please refresh the page again！');
		}
	});

	// 空运热门港口数据获取
	$.ajax({
		type : "post",
		async : false,
		datatype : "json",
		url : preUrl + "getHotKongYun.do",
		data : {
			"pageno" : 0,
		},
		success : function(data) {
			var html = generateAirResults(data.result, today, false);
			$("#type3").html(html);
			$("#pageCode3").empty();
			$("#pageCode3").hide();
			$("#pageCode3").createPage({
				pageCount : Math.ceil(data.total / 6),
				current : 1,
				type : 3,
				backFn : function(args, pageno) {
					divHotChange(args, pageno);
				}
			});

		},
		error : function() {
			$("#loadImgDiv").hide();
			showNotice('The data load fails, Please try again！');
		}
	});
	$("#loadImgDiv").hide();

}

function loadExpData() {
	$("#loadImgDiv").show();
	var preUrl = "/freight/";
	var today = new Date();
	// 快邮目的国家
	$.ajax({
		type : "post",
		async : false,
		datatype : "json",
		url : preUrl + "ajaxKuaiYunName.do",
		data : {
			"doctor_name" : ""
		},
		success : function(data) {
			kuaiyunData = data;
			$("#ii").combobox("loadData", data);
		},
		error : function() {
			$("#loadImgDiv").hide();
			showNotice('The data load fails, please refresh the page again！');
		}
	});
	$("#loadImgDiv").hide();
}

function showNotice(msg) {
	var layer = document.createElement("div");
	layer.id = "layer";
	layer.innerHTML = msg;

	var style = {
		background : "#FF0000",
		position : "absolute",
		zIndex : 10,
		width : "400px",
		left : "60%",
		top : "310px",
		border : "1px #e2e2e2 solid",
		color : "#fff",

	}
	for ( var i in style) {
		layer.style[i] = style[i];
	}
	if (document.getElementById("layer") == null) {
		document.body.appendChild(layer);
		setTimeout("document.body.removeChild(layer)", 3000)
	}
}

function saveAndJump(trafficType, showRecords, selectRecords) {
	var sessionStorage = window.sessionStorage;
	sessionStorage.setItem("trafficType", trafficType);
	sessionStorage.setItem("showRecords", showRecords);
	sessionStorage.setItem("selectRecords", selectRecords);
	window.location.href = "/freight/Contactus.html";
}
