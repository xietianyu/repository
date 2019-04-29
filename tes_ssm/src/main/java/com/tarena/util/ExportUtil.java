package com.tarena.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import com.tarena.entity.Role;
import com.tarena.entity.User;

/**
 * 用来导出的工具类
 * 导出若干种格式
 * @author Administrator
 *
 */
public class ExportUtil {
	/**
	 * 导出excel的方法
	 * @param users  集合数据
	 * @return  excel的字节数组
	 */
	public  static  byte[] write2Excel(List<User> users){
		byte[] data=null;
		//字节数组输出流,也可以看成内存流
		ByteArrayOutputStream out=null;
		try{
			//创建excel2003的文件(老版本  格式为xls)
			Workbook wb=new HSSFWorkbook();//创建工作簿
			out=new ByteArrayOutputStream();
			//创建工作表
			Sheet sheet=wb.createSheet("allusers");
			int columnCount=12;
			//创建一个行对象
			Row row=sheet.createRow(0);
			//定义列头信息
			String[] titleArray={
					"登录名",
					"登录类型",
					"昵称",
					"密码",
					"用户类型",
					"头像",
					"积分",
					"锁",
					"注册日期",
					"年龄",
					"性别",
					"角色"
			};
			//给第一行的12列添加内容
			for(int i=0;i<columnCount;i++){
				Cell cell=row.createCell(i);
				//控制单元格子的样式
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
			    sheet.setColumnWidth(i, 6000);
			    CellStyle style=wb.createCellStyle();
			    Font font=wb.createFont();
			    font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			    short color=HSSFColor.RED.index;
			    font.setColor(color);
			    style.setFont(font);
			    cell.setCellStyle(style);
			    //给单元格子添加数据
			    cell.setCellValue(titleArray[i]);
			}
			//循环创建新行,每个行都对应着数据表中的一行数据
			for(int j=0;j<users.size();j++){
				User user=users.get(j);
				row=sheet.createRow(j+1);
				//给当前行的每一个单元格子添加数据
				row.createCell(0).setCellValue(user.getLoginName());
				row.createCell(1).setCellValue(user.getLoginType());
				row.createCell(2).setCellValue(user.getNickName());
				row.createCell(3).setCellValue(user.getPassword());
				if(user.getType()==0){
					row.createCell(4).setCellValue("学生");
				}else if(user.getType()==1){
					row.createCell(4).setCellValue("讲师");
				}else if(user.getType()==2){
					row.createCell(4).setCellValue("管理员");
				}else if(user.getType()==3){
					row.createCell(4).setCellValue("游客");
				}
				row.createCell(5).setCellValue(user.getHead());
				row.createCell(6).setCellValue(user.getScore());
				row.createCell(7).setCellValue(user.getIsLock());
				row.createCell(8).setCellValue(user.getRegDate().toLocaleString());
				row.createCell(9).setCellValue(user.getAge());
				row.createCell(10).setCellValue(user.getSex());
				if(user.getRoles()!=null && user.getRoles().size()>0){
					String roleName="";
					for(Role role : user.getRoles()){
						roleName+=role.getName()+",";
					}
					row.createCell(11).setCellValue(roleName.substring(0,roleName.length()-1));
				}else{
					row.createCell(11).setCellValue("无角色");
				}
			}
			wb.write(out);//把excel的数据写到内存中的字节输出流中
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				if(out!=null){
					out.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		data=out.toByteArray();//把内存输出流中的数据转换成字节数组
		return data;
	}
}
