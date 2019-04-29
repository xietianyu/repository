package com.tarena.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 存储的都是分页相关信息
 * @author admin
 *
 */
public class Page<T> implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int currentPage;//当前页
	private int pageSize;//每页显示多少条数据
	private int previousPage;//前一页
	private int nextPage;//下一页
	private int totalCount;//总记录数
	private int totalPage;//总页数
	
	private List<T> data;//当前页的数据
	private String roleKeyword;//角色的模糊关键字
	private String userKeyword;//用户的模糊关键字
	
	private List<Integer> aNum;//bootstrap分页条中存在的超链接个数
	
	private int begin;//分页的第一条记录号
	private String roleType;//角色类型,用户分页时使用
	
	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	public int getBegin() {
		this.begin=(currentPage-1)*pageSize;
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public List<Integer> getaNum() {
		return aNum;
	}

	public void setaNum(List<Integer> aNum) {
		this.aNum = aNum;
	}	

	public String getRoleKeyword() {
		return roleKeyword;
	}

	public void setRoleKeyword(String roleKeyword) {
		this.roleKeyword = roleKeyword;
	}

	public String getUserKeyword() {
		return userKeyword;
	}

	public void setUserKeyword(String userKeyword) {
		this.userKeyword = userKeyword;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPreviousPage() {
		return previousPage;
	}

	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "Page [currentPage=" + currentPage + ", pageSize=" + pageSize + ", previousPage=" + previousPage
				+ ", nextPage=" + nextPage + ", totalCount=" + totalCount + ", totalPage=" + totalPage + ", data="
				+ data + ", roleKeyword=" + roleKeyword + ", userKeyword=" + userKeyword + ", aNum=" + aNum + ", begin="
				+ begin + "]";
	}	
}
