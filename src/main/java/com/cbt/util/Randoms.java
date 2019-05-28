package com.cbt.util;

import java.util.Date;
import java.util.Random;
public class Randoms {
	Date now = new Date();
	 String d = now.getTime()+"";
	 int random = new Random().nextInt(100);
	 String a=Integer.toString(random);
	 String c=d+a;
}
