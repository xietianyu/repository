package com.tarena.vo;

import java.io.Serializable;

public class Chart implements Serializable{

	private static final long serialVersionUID = 1L;
	private int value;
	private String color;
	private String highlight;
	private String label;
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getHighlight() {
		return highlight;
	}
	public void setHighlight(String highlight) {
		this.highlight = highlight;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	

}
