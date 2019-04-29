package com.tarena.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component("pageUtil")
public class PageUtil {
	@Value("#{props.pageSize}")//#{props[pageSize]}
	private int pageSize;
	@Value("#{props.showNum_a}")
	private int showNum_a;
	public int getPageSize() {
		return pageSize;
	}
	public int getShowNum_a() {
		return showNum_a;
	}
	
}
