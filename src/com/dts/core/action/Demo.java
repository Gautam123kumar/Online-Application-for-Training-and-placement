package com.dts.core.action;

import java.util.Random;

public class Demo {


	public static void main(String[] args) {
		
		
		Random r = new Random();
		int Low = 01;
		int High = 05;
		int Result = r.nextInt(High-Low) + Low;
		System.out.println(Result);
	}
	
}
