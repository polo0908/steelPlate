package com.yf.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringHelp {
	// 判断是否为数字
	public static boolean isNum(String str, String regex) {
		// 编译正则表达式
		Pattern pattern = Pattern.compile(regex);
		// 验证字符串是否符合正则表达式
		Matcher matcher = pattern.matcher(str);
		return matcher.matches();
	}

	/**
	 * 验证邮箱
	 * 
	 * @param email
	 * @return
	 */
	public static boolean checkEmail(String email) {
		boolean flag = false;
		try {
			String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			Pattern regex = Pattern.compile(check);
			Matcher matcher = regex.matcher(email);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	/**
	 * 验证手机号码
	 * 
	 * @param mobiles
	 * @return
	 */
	public static boolean checkMobileNumber(String mobileNumber) {
		boolean flag = false;
		try {
			Pattern regex = Pattern
					.compile("^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
			Matcher matcher = regex.matcher(mobileNumber);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}
	// public static String getFileName(){
	// //获取当时时间
	// SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
	// return sdf.format(new Date());
	// }

	/**
	 * 验证double类型的字符串的
	 * 
	 * @param String
	 * @return
	 */
	public static boolean isNumberString(String str) {
		String regex = "^[0-9.]+$";
		Pattern pattern = Pattern.compile(regex);
		Matcher match = pattern.matcher(str);
		boolean flg = false;
		if (match.find()) {
			flg = true;
		}
		return flg;
	}

	/**
	 * 验证全英文类型的字符串的
	 * 
	 * @param String
	 * @return
	 */
	public static boolean isEnglishString(String str) {
		String regex = "^[a-zA-z]+$";
		Pattern pattern = Pattern.compile(regex);
		Matcher match = pattern.matcher(str);
		boolean flg = false;
		if (match.find()) {
			flg = true;
		}
		return flg;
	}

	/**
	 * 判断中文字符
	 * 
	 * @param c
	 * @return
	 */
	public static final boolean isChinese(char c) {
		Character.UnicodeBlock ub = Character.UnicodeBlock.of(c);
		// GENERAL_PUNCTUATION 判断中文的“号
		// CJK_SYMBOLS_AND_PUNCTUATION 判断中文的。号
		// HALFWIDTH_AND_FULLWIDTH_FORMS 判断中文的，号
		if (ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS
				|| ub == Character.UnicodeBlock.CJK_COMPATIBILITY_IDEOGRAPHS
				|| ub == Character.UnicodeBlock.CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A
				|| ub == Character.UnicodeBlock.GENERAL_PUNCTUATION
				|| ub == Character.UnicodeBlock.CJK_SYMBOLS_AND_PUNCTUATION
				|| ub == Character.UnicodeBlock.HALFWIDTH_AND_FULLWIDTH_FORMS) {
			return true;
		}
		return false;
	}

	/**
	 * 验证字符串是否含有中文
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isHasChinese(String str) {
		boolean isChinese = false;
		for (int i = 0; i < str.length(); i++) {
			if (isChinese(str.charAt(i))) {
				isChinese = true;
				break;
			}
		}
		return isChinese;
	}

}
