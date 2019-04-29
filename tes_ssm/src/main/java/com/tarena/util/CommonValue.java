package com.tarena.util;

import java.util.ArrayList;
import java.util.List;

public class CommonValue {
	public static List<String> contentTypes;
	static{
		contentTypes=new ArrayList<String>();
		contentTypes.add("image/bmp");
		contentTypes.add("image/gif");
		contentTypes.add("image/x-icon");
		contentTypes.add("image/jpeg");
		contentTypes.add("image/jpg");
		contentTypes.add("image/png");
	}
}
