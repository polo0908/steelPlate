package com.cal.print;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFSheet;

import com.artofsolving.jodconverter.DocumentConverter;
import com.artofsolving.jodconverter.openoffice.connection.OpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.connection.SocketOpenOfficeConnection;
import com.artofsolving.jodconverter.openoffice.converter.OpenOfficeDocumentConverter;
import com.cal.bean.ClientOrder;
import com.cal.bean.OrderDetails;
import com.cal.bean.QuotationVO;
import com.cal.util.DownloadUtil;
import com.cal.util.UtilFuns;


/**
 * @Description: 根据模板文件打印，复制sheet，然后写单元格值；最终删除模板sheet，不留痕迹；这样样式工作可视化，无需代码，同时也加快的展现效率；
 * @Author:	polo
 * @CreateDate:	2017/2/27
 */

public class ContractPrintTemplate {
	
	public void print(QuotationVO quotation,String path, HttpServletResponse response,HttpServletRequest request,
			List<String> ms, List<String> gs) throws Exception{
		/*
		 * 1.获取数据
		 * 2.封装每页数据
		 * 3.打印
		 */
		ClientOrder clientOrder = quotation.getClientOrder();
		List<OrderDetails> list = quotation.getOrderDetails();		

		int tl = list.size();
		
	     
		/*
		 * 打开模板，复制sheet，另存
		 */
		File file = new File(path+"calculator/xlsprint/CSG_Quotation_Ver3.xls");	

			
		FileInputStream fi = new FileInputStream(file);
		HSSFWorkbook wb = new HSSFWorkbook(fi);
			wb.cloneSheet(0);						//复制工作簿
			wb.setSheetName(1, "Quotation");		//设置工作簿名称
		

			
		    //设置相同内容
			int rowNo = 2;
			int colNo = 0;
			Row nRow = null;
			Cell nCell = null;
			
			HSSFSheet sheet = wb.getSheetAt(1);						//定位到当前工作表
			sheet.setForceFormulaRecalculation(true);				//强制公式自动计算，利用模板时，模板中的公式不会因值发生变化而自动计算。
			
			if(tl > 10){
				for(int j=0;j<tl-10;j++){
				 insertRow(wb, sheet, 18, 1);	
				 sheet.addMergedRegion(new CellRangeAddress(19, 19,(short)2,(short)6));
				}								
			}	
			
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(2);
			nCell.setCellValue(UtilFuns.convertNull(clientOrder.getCity()) +","+UtilFuns.convertNull(clientOrder.getCountry()));
			
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(2);
			nCell.setCellValue(UtilFuns.convertNull(clientOrder.getEmail()));
			
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(2);
			nCell.setCellValue(clientOrder.getCreateTime());
			nCell = nRow.getCell(6);
			nCell.setCellValue("RFQ@csmfg.com");
		
			nRow = sheet.getRow(rowNo++);
			nCell = nRow.getCell(2);
			nCell.setCellValue("30 Days");
			
			Double unitPrice = 0.0;
				for(int i = 0; i < tl; i++){
				    rowNo = 9+i;
				    nRow = sheet.getRow(rowNo);
					nCell = nRow.getCell(1);
					nCell.setCellValue(UtilFuns.convertNull(list.get(i).getPartName()));	
					
					nRow = sheet.getRow(rowNo);
					nCell = nRow.getCell(2);
					nCell.setCellValue(UtilFuns.convertNull(gs.get(i)) + "/" + UtilFuns.convertNull(ms.get(i)) +" "+list.get(i).getProductSize());				
					
					
					nRow = sheet.getRow(rowNo);
					nCell = nRow.getCell(7);
					nCell.setCellValue(list.get(i).getGoodsSet());
					
					
					nRow = sheet.getRow(rowNo);
					nCell = nRow.getCell(8);
					nCell.setCellValue(list.get(i).getPrice());
					
					
					nRow = sheet.getRow(rowNo);
					nCell = nRow.getCell(9);
					nCell.setCellValue(list.get(i).getProductProcessPrice());	
					
			     	unitPrice +=(new BigDecimal(list.get(i).getProductProcessPrice()).add(new BigDecimal(list.get(i).getPrice()))).multiply(new BigDecimal(list.get(i).getGoodsSet())).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();	         
				 }	

			 if(tl > 10){
			   rowNo = 9+tl; 
			 }else{
			   rowNo = 19; 
			 }
			 
			 nRow = sheet.getRow(rowNo++);
			 nCell = nRow.getCell(2);
			 nCell.setCellValue(unitPrice);
			
			 
			 nRow = sheet.getRow(rowNo++);
			 nCell = nRow.getCell(1);
			 nCell.setCellValue("Profit,Management Cost:" + clientOrder.getProfitRate() * 100 + "%");
			 nCell = nRow.getCell(2);
			 nCell.setCellValue(clientOrder.getProfitManagment());
			 nCell = nRow.getCell(5);
			 nCell.setCellValue(new BigDecimal(clientOrder.getTotalWeight()).setScale(1, BigDecimal.ROUND_DOWN).doubleValue());
			 
			 
			 nRow = sheet.getRow(rowNo++);
			 nCell = nRow.getCell(2);
			 nCell.setCellValue(clientOrder.getTax());
			 nCell = nRow.getCell(5);
			 nCell.setCellValue(clientOrder.getShippingFee());
			  		 
			 
			 nRow = sheet.getRow(rowNo++);	
			 nCell = nRow.getCell(2);
			 nCell.setCellValue(clientOrder.getFinallyPrice());
			 nCell = nRow.getCell(5);
			 nCell.setCellValue(clientOrder.getDiscount());

			 
			 rowNo++;
			 nRow = sheet.getRow(rowNo++);
			 nCell = nRow.getCell(2);
			 nCell.setCellValue(clientOrder.getTotalSets());
			 nCell = nRow.getCell(5);
			 nCell.setCellValue(clientOrder.getTotalPrice());
			 
			 nRow = sheet.getRow(rowNo++);
			 nCell = nRow.getCell(2);
			 nCell.setCellValue(clientOrder.getInlandShippingCost());
			 nCell = nRow.getCell(5);
			 nCell.setCellValue(clientOrder.getFobPrice());

//			 ServletContext sctx = request.getSession().getServletContext();				
//			 String pic1 = sctx.getRealPath("/calculator/xlsprint/img/1.png");
//			 String pic2 = sctx.getRealPath("/calculator/xlsprint/img/2.png");
//			 String pic3 = sctx.getRealPath("/calculator/xlsprint/img/3.png");
//			 String pic4 = sctx.getRealPath("/calculator/xlsprint/img/4.png");
//			 String pic5 = sctx.getRealPath("/calculator/xlsprint/img/5.png");
//			 String pic6 = sctx.getRealPath("/calculator/xlsprint/img/6.png");
//			 String pic7 = sctx.getRealPath("/calculator/xlsprint/img/7.png");
//			 String pic8 = sctx.getRealPath("/calculator/xlsprint/img/8.png");
             

//			 if(tl > 10){
//			     rowNo = 21+tl; 			   
//				 setPicture(pic1, sheet, 21+tl, 1, 28+tl, 3);
//				 setPicture(pic2, sheet, 21+tl, 3, 28+tl, 5);
//				 setPicture(pic3, sheet, 21+tl, 5, 28+tl, 7);
//				 setPicture(pic4, sheet, 21+tl, 7, 28+tl, 10);
//				 setPicture(pic5, sheet, 29+tl, 1, 36+tl, 3);
//				 setPicture(pic6, sheet, 29+tl, 3, 36+tl, 5);
//				 setPicture(pic7, sheet, 29+tl, 5, 36+tl, 7);
//				 setPicture(pic8, sheet, 29+tl, 7, 36+tl, 10);
//			 }else{
//			   rowNo = 31;
//				 setPicture(pic1, sheet, 31, 1, 38, 3);
//				 setPicture(pic2, sheet, 31, 3, 38, 5);
//				 setPicture(pic3, sheet, 31, 5, 38, 7);
//				 setPicture(pic4, sheet, 31, 7, 38, 10);
//				 setPicture(pic5, sheet, 39, 1, 46, 3);
//				 setPicture(pic6, sheet, 39, 3, 46, 5);
//				 setPicture(pic7, sheet, 39, 5, 46, 7);
//				 setPicture(pic8, sheet, 39, 7, 46, 10);
//			 }
			 

		
			 
			 
		wb.removeSheetAt(0);					//删除模板sheet
		
		DownloadUtil du = new DownloadUtil();
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		wb.write(bos);
		bos.close();
		du.download(bos, response, "CSG_Quotation_Ver.xls");
		wb.setFirstVisibleTab(1);
		
		
//		 String paths = "/usr/local/apache-tomcat-7.0.52/webapps/drawing";
//		 String paths = "G:\\pdf";
//		 FileOutputStream fs = new FileOutputStream(paths+ File.separator +"CSG_Quotation_Ver.xls",false);
//		 wb.write(fs);	
//		 fs.close();		 
//		 office2PDF(paths+ File.separator+"CSG_Quotation_Ver.xls", paths+File.separator+ "CSG_Quotation_Ver.pdf");
//		 du.download(paths+File.separator+ "CSG_Quotation_Ver.pdf", "CSG_Quotation_Ver.pdf", response, false);
//		 delAllFile(paths);
		
	}
	
	//处理图片，excel中图片是单独对象存放
	public void setPicture(String pic, XSSFSheet sheet, int startRow, int startCol, int stopRow, int stopCol) throws IOException{
		File imageFile = new File(pic);
		if(imageFile.exists()){
			InputStream is = new FileInputStream(new File(pic));
			byte[] bytes = IOUtils.toByteArray(is);
			int pictureIdx = sheet.getWorkbook().addPicture(bytes, Workbook.PICTURE_TYPE_JPEG);		//扩展名可为.jpg/.jpeg/.png
			is.close();
			
			XSSFDrawing drawing = sheet.createDrawingPatriarch();	// Create the drawing patriarch.  This is the top level container for all shapes.
			//前面四个参数是图片偏移量
			XSSFClientAnchor anchor = new XSSFClientAnchor(512, 255, 0, 0, (short)startCol, startRow, (short)stopCol, stopRow);	//add a picture shape
			anchor.setRow1(startRow);							//set position corner of the picture		
			anchor.setCol1(startCol);
			anchor.setRow2(stopRow);
			anchor.setCol2(stopCol);
			
			drawing.createPicture(anchor, pictureIdx);
		}
	}
	
	
	public void print(HttpServletResponse response) throws ParseException, FileNotFoundException, IOException{

		/*
		 * 打开模板，复制sheet，另存
		 */
		HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(new File("D:/apache-tomcat-7.0.57/wtpwebapps/steelPlate/calculator/xlsprint/tCONTRACT.xls")));
		for(int i=0;i<2;i++){
			wb.cloneSheet(0);								//复制工作簿
			wb.setSheetName(i+1, "Sheet("+(i+1)+")");		//设置工作簿名称
		}
		
		//设置相同内容
		for(int i=1;i<wb.getNumberOfSheets();i++){
			Row nRow = null;
			Cell nCell = null;
			
			Sheet sheet = wb.getSheetAt(i);						//定位到当前工作表
			System.out.println(sheet.getLastRowNum());
			
//			nRow = sheet.getRow(6);
//			nCell = nRow.getCell(1);
//			nCell.setCellValue("Offeror");
			
			System.out.println("=================================="+i);
		}
//		response.setContentType("applicationnd.ms-excel");
//		response.setHeader("Content-disposition", "attachment;filename=subscribeEmail.xls");
//		OutputStream ouputStream = response.getOutputStream();
//		wb.write(ouputStream);
//		ouputStream.flush();
//		ouputStream.close();
		
		
		wb.write(new FileOutputStream("e:\\ys.xls"));
	}	

	
	
//  Parameters:
//  startRow - the row to start shifting
//  endRow - the row to end shifting
//  n - the number of rows to shift
//  copyRowHeight - whether to copy the row height during the shift
//  resetOriginalRowHeight - whether to set the original row's height to the default
	public static void insertRow(HSSFWorkbook wb, HSSFSheet sheet, int starRow,int rows) {

		
		  sheet.shiftRows(starRow + 1, sheet.getLastRowNum(), rows,true,false);
		  
		  starRow = starRow - 1;

		  for (int i = 0; i < rows; i++) {

		   HSSFRow sourceRow = null;
		   HSSFRow targetRow = null;
		   HSSFCell sourceCell = null;
		   HSSFCell targetCell = null;
		   short m;

		   starRow = starRow + 1;
		   sourceRow = sheet.getRow(starRow);
		   targetRow = sheet.createRow(starRow + 1);
		   targetRow.setHeight(sourceRow.getHeight());

		   for (m = sourceRow.getFirstCellNum(); m < sourceRow.getLastCellNum(); m++) {

		    sourceCell = sourceRow.getCell(m);
		    targetCell = targetRow.createCell(m);
		    targetCell.setCellStyle(sourceCell.getCellStyle());
		    targetCell.setCellType(sourceCell.getCellType());

		   }
		  }

		 }

    
	    /**  
	     * 将Office文档转换为PDF. 运行该函数需要用到OpenOffice, OpenOffice下载地址为  
	     * http://www.openoffice.org/  
	     *   
	     * <pre>  
	     * 方法示例:  
	     * String sourcePath = "F:\\office\\source.doc";  
	     * String destFile = "F:\\pdf\\dest.pdf";  
	     * Converter.office2PDF(sourcePath, destFile);  
	     * </pre>  
	     *   
	     * @param sourceFile  
	     *            源文件, 绝对路径. 可以是Office2003-2007全部格式的文档, Office2010的没测试. 包括.doc,  
	     *            .docx, .xls, .xlsx, .ppt, .pptx等. 示例: F:\\office\\source.doc  
	     * @param destFile  
	     *            目标文件. 绝对路径. 示例: F:\\pdf\\dest.pdf  
	     * @return 操作成功与否的提示信息. 如果返回 -1, 表示找不到源文件, 或url.properties配置错误; 如果返回 0,  
	     *         则表示操作成功; 返回1, 则表示转换失败  
	     */    

      private static String openOfficePath = "C:\\Program Files (x86)\\OpenOffice 4";
//        private static String openOfficePath = "/opt/openoffice4";

	    public static int office2PDF(String sourceFile, String destFile) throws Exception{    
	        try {    
	        	File inputFile = new File(sourceFile);    
	            if (!inputFile.exists()) {    
	                return -1;// 找不到源文件, 则返回-1    
	            }    
	    
	            // 如果目标路径不存在, 则新建该路径    
	            File outputFile = new File(destFile);    
	            if (!outputFile.getParentFile().exists()) {    
	                outputFile.getParentFile().mkdirs();    
	            }    
	    
	            String OpenOffice_HOME = openOfficePath;//这里是OpenOffice的安装目录    
	            // 如果从文件中读取的URL地址最后一个字符不是 '\'，则添加'\'    
	            if (OpenOffice_HOME.charAt(OpenOffice_HOME.length() - 1) != '/') {    
	                OpenOffice_HOME += "/";    
	            }    
	            // 启动OpenOffice的服务    
//	            String command = OpenOffice_HOME    
//	                    + "program/soffice -headless -accept=\"socket,host=162.249.2.241,port=8100;urp;\" -nofirststartwizard&";      
//	            Process pro = Runtime.getRuntime().exec(command); 
//	            // connect to an OpenOffice.org instance running on port 8100    
//	            OpenOfficeConnection connection = new SocketOpenOfficeConnection("162.249.2.241", 8100);   
	            
	            
//	            // 启动OpenOffice的服务    
//	            String command = OpenOffice_HOME    
//	            		+ "program/soffice -headless -accept=\"socket,host=67.198.209.91,port=8100;urp;\" -nofirststartwizard";      
//	            Process pro = Runtime.getRuntime().exec(command); 
//	            // connect to an OpenOffice.org instance running on port 8100    
//	            OpenOfficeConnection connection = new SocketOpenOfficeConnection("67.198.209.91", 8100);    
	            
	            
//	            // 启动OpenOffice的服务    (window启动)
	            String command = OpenOffice_HOME    
	            		+ "program\\soffice -headless -accept=\"socket,host=192.168.1.151,port=8100;urp;\" -nofirststartwizard";      
	            Process pro = Runtime.getRuntime().exec(command); 
	            // connect to an OpenOffice.org instance running on port 8100    
	            OpenOfficeConnection connection = new SocketOpenOfficeConnection("192.168.1.151", 8100);    
	            connection.connect();    
	    
	            // convert    
	            DocumentConverter converter = new OpenOfficeDocumentConverter(    
	                    connection);    
	            converter.convert(inputFile, outputFile);    
	    
	            // close the connection    
	            connection.disconnect();    
	            // 关闭OpenOffice服务的进程    
	            pro.destroy();    
	            return 0;    
	        } catch (FileNotFoundException e) {    
	            e.printStackTrace();    
	            return -1;    
	        } catch (IOException e) {    
	            e.printStackTrace();    
	        }    	    	    
	        return 1;    
	    }      

	  //删除指定文件夹下所有文件
		//param path 文件夹完整绝对路径
		   public static boolean delAllFile(String path) {
		       boolean flag = false;
		       File file = new File(path);
		       if (!file.exists()) {
		         return flag;
		       }
		       if (!file.isDirectory()) {
		         return flag;
		       }
		       String[] tempList = file.list();
		       File temp = null;
		       for (int i = 0; i < tempList.length; i++) {
		          if (path.endsWith(File.separator)) {
		             temp = new File(path + tempList[i]);
		          } else {
		              temp = new File(path + File.separator + tempList[i]);
		          }
		          if (temp.isFile()) {
		             temp.delete();
		          }
		          if (temp.isDirectory()) {
		             delAllFile(path + "/" + tempList[i]);//先删除文件夹里面的文件
//		             delFolder(path + "/" + tempList[i]);//再删除空文件夹
		             flag = true;
		          }
		       }
		       return flag;
		     }
		
  
}
