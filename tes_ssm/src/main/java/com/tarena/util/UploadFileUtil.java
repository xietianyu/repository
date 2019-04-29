package com.tarena.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;
/**
 * 上传图片的工具工具类
 * @author Administrator
 *
 */
public class UploadFileUtil {
	/**
	 * 按比例缩放图片
	 * @param img  原始图片
	 * @param width 缩放后宽度
	 * @param isScale 是否按比例缩放
	 *       true:按实际比例缩放
	 *       false:按1:1缩放
	 * @return  缩放后BufferedImage对象
	 */
	private static BufferedImage resizeByWidth(BufferedImage img,int width,boolean isScale){
		BufferedImage saveImage=null;
		if(isScale){
			//等比缩放
			int height=(int)((float)img.getHeight()/img.getWidth()*width);
			saveImage=new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
			Graphics2D g=saveImage.createGraphics();
			g.drawImage(img, 0, 0, width, height, null);
		}else{
			//1:1缩放
			int height=width;
			saveImage=new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
			Graphics2D g=saveImage.createGraphics();
			g.drawImage(img, 0, 0, width, height, null);
		}
		return saveImage;
	}
	/**
	 * 上传图片的工具方法
	 * @param picture 要上传的文件
	 * @param uuid  上传文件后的图片名称
	 * @param isScale 是否是按照比例缩放
	 *        true:按照实际比例缩放
	 *        false:按照1:1缩放
	 * @param width 缩放后的宽度
	 * @param path 缩放后的存储路径
	 * @return boolean
	 *         true:上传成功
	 *         false:上传失败
	 */
	public static boolean uploadImage(MultipartFile picture,String uuid,boolean isScale,int width,String path){
		boolean flag=false;
		try{
			InputStream stream=picture.getInputStream();
			//转换输入流对象为BufferedImage对象
			BufferedImage image=ImageIO.read(stream);
			//按照原始图片的比例缩放
			image=resizeByWidth(image,width,isScale);
			//给缩放后的图片添加水印
			Graphics2D g=(Graphics2D)image.getGraphics();
			g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
			g.setColor(new Color(0x000000));
			g.drawString("TES", 5, 35);
			
			//上传文件
			String originalFileName=picture.getOriginalFilename();
			String originalExtendName=originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			String imageFileName=uuid+"."+originalExtendName;
			
			File realPath=new File(path);
			if(!realPath.exists()){
				realPath.mkdir();
			}
			//写出文件
			ImageIO.write(image, originalExtendName, new File(realPath,imageFileName));
			flag=true;			
		}catch(Exception e){
			e.printStackTrace();
		}		
		return flag;
	}
}
