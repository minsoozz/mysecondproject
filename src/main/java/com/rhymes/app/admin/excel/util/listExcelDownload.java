package com.rhymes.app.admin.excel.util;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import com.rhymes.app.admin.excel.model.DtestDTO;
import com.rhymes.app.payment.model.PaymentDTO;

public class listExcelDownload extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> modelMap, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String sCurTime = null;
        sCurTime = new SimpleDateFormat("yyyyMMdd", Locale.KOREA).format(new Date());
     
        String excelName = sCurTime + "RHYMESb 결제내역_엑셀다운로드.xlsx";
        Sheet worksheet = null;
        Row row = null;
        CellStyle style = workbook.createCellStyle(); // 셀 스타일을 위한 변수
        style.setAlignment(CellStyle.ALIGN_CENTER); // 글 위치를 중앙으로 설정
         
        List<PaymentDTO> listExcel = (List<PaymentDTO>)modelMap.get("payment_list");
         
        // 새로운 sheet를 생성한다.
        worksheet = workbook.createSheet("엑셀 목록");
         
        // 가장 첫번째 줄에 제목을 만든다.
        row = worksheet.createRow(0);
         
        // 칼럼 길이 설정
        int columnIndex = 0;
        while (columnIndex < 20) {
             
            if(columnIndex == 0) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 1) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 2) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 3) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 4) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 5) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 6) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 7) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 8) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 9) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 10) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 11) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 12) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 13) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 14) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 15) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 16) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 17) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 18) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 19) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }
            columnIndex++;
        }


        // 헤더 설정
        row = worksheet.createRow(0);
        row.createCell(0).setCellValue("SEQ");
        row.createCell(1).setCellValue("PAYMENT_CODE");
        row.createCell(2).setCellValue("USERID");
        row.createCell(3).setCellValue("SEND_NAME");
        row.createCell(4).setCellValue("SEND_PHONE");
        row.createCell(5).setCellValue("SEND_EMAIL");
        row.createCell(6).setCellValue("RECEIVE_NAME");
        row.createCell(7).setCellValue("RECEIVE_PHONE");
        row.createCell(8).setCellValue("RECEIVE_POSTNUM");
        row.createCell(9).setCellValue("RECEIVE_ADDRESS");
        row.createCell(10).setCellValue("PAYMENT_METHOD");
        row.createCell(11).setCellValue("PAYMENT_STATUS");
        row.createCell(12).setCellValue("DISC_COUPON");
        row.createCell(13).setCellValue("DELIVERY_PRICE");
        row.createCell(14).setCellValue("COUPON_CODE");
        row.createCell(15).setCellValue("DISC_POINT");
        row.createCell(16).setCellValue("DISC_PRODUCT");
        row.createCell(17).setCellValue("ADD_POINT");
        row.createCell(18).setCellValue("TOTALPRICE");
        row.createCell(19).setCellValue("RDATE");
         
        int rowIndex = 1;
        
        int i = 0;
        // 각 해당하는 셀에 값과 스타일을 넣음
        for(PaymentDTO excel : listExcel) {
            row = worksheet.createRow(rowIndex);
            row.createCell(i++).setCellValue(excel.getSeq());
            row.createCell(i++).setCellValue(excel.getPayment_code());
            row.createCell(i++).setCellValue(excel.getUserid());
            row.createCell(i++).setCellValue(excel.getSend_name());
            row.createCell(i++).setCellValue(excel.getSend_phone());
            row.createCell(i++).setCellValue(excel.getSend_email());
            row.createCell(i++).setCellValue(excel.getReceive_name());
            row.createCell(i++).setCellValue(excel.getReceive_phone());
            row.createCell(i++).setCellValue(excel.getReceive_postnum());
            row.createCell(i++).setCellValue(excel.getReceive_address());
            row.createCell(i++).setCellValue(excel.getPayment_method());
            row.createCell(i++).setCellValue(excel.getPayment_status());
            row.createCell(i++).setCellValue(excel.getDisc_coupon());
            row.createCell(i++).setCellValue(excel.getDelivery_price());
            row.createCell(i++).setCellValue(excel.getCoupon_code());
            row.createCell(i++).setCellValue(excel.getDisc_point());
            row.createCell(i++).setCellValue(excel.getDisc_product());
            row.createCell(i++).setCellValue(excel.getAdd_point());
            row.createCell(i++).setCellValue(excel.getTotalprice());
            row.createCell(i++).setCellValue(excel.getRdate());
             
            rowIndex++;
        }



        // 셀 병합 CellRangeAddress(시작 행, 끝 행, 시작 열, 끝 열)
        worksheet.addMergedRegion(
                new CellRangeAddress(listExcel.size() + 1, listExcel.size() + 1, 0, 20));
         
        // 병합 테스트를 위한 설정
        row = worksheet.createRow(listExcel.size() + 1);
        row.createCell(0).setCellValue("셀 병합 테스트");
        row.getCell(0).setCellStyle(style); // 지정한 스타일을 입혀준다.
         
         
        try {
            response.setHeader("Content-Disposition", "attachement; filename=\""
                + java.net.URLEncoder.encode(excelName, "UTF-8") + "\";charset=\"UTF-8\"");
          } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
          }
   
        
        
	
	}
	
}
