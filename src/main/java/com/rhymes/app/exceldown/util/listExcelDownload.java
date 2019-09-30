package com.rhymes.app.exceldown.util;

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

import com.rhymes.app.exceldown.model.DtestDTO;

public class listExcelDownload extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> modelMap, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String sCurTime = null;
        sCurTime = new SimpleDateFormat("yyyyMMdd", Locale.KOREA).format(new Date());
     
        String excelName = sCurTime + "회원정보_엑셀다운로드.xlsx";
        Sheet worksheet = null;
        Row row = null;
        CellStyle style = workbook.createCellStyle(); // 셀 스타일을 위한 변수
        style.setAlignment(CellStyle.ALIGN_CENTER); // 글 위치를 중앙으로 설정
         
        List<DtestDTO> listExcel = (List<DtestDTO>)modelMap.get("list");
         
        // 새로운 sheet를 생성한다.
        worksheet = workbook.createSheet("엑셀 목록");
         
        // 가장 첫번째 줄에 제목을 만든다.
        row = worksheet.createRow(0);
         
        // 칼럼 길이 설정
        int columnIndex = 0;
        while (columnIndex < 8) {
             
            if(columnIndex == 0) {
                worksheet.setColumnWidth(columnIndex, 3000);
            }else if (columnIndex == 1) {
                worksheet.setColumnWidth(columnIndex, 4000);
            }else if (columnIndex == 2) {
                worksheet.setColumnWidth(columnIndex, 10000);
            }else if (columnIndex == 3) {
                worksheet.setColumnWidth(columnIndex, 8000);
            }else if (columnIndex == 4) {
                worksheet.setColumnWidth(columnIndex, 6000);
            }else if (columnIndex == 5) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 6) {
                worksheet.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 1) {
                worksheet.setColumnWidth(columnIndex, 4000);
            }
            columnIndex++;
        }


        // 헤더 설정
        row = worksheet.createRow(0);
        row.createCell(0).setCellValue("ID");
        row.createCell(1).setCellValue("NAME");
        row.createCell(2).setCellValue("ADDRESS");
        row.createCell(3).setCellValue("EMAIL");
        row.createCell(4).setCellValue("PHONE");
        row.createCell(5).setCellValue("GENDER");
        row.createCell(6).setCellValue("BIRTH");
        row.createCell(7).setCellValue("COUNT");
         
        int rowIndex = 1;
        
        // 각 해당하는 셀에 값과 스타일을 넣음
        for(DtestDTO excel : listExcel) {
            row = worksheet.createRow(rowIndex);
            row.createCell(0).setCellValue(excel.getId());
            row.createCell(1).setCellValue(excel.getName());
            row.createCell(2).setCellValue(excel.getAddress());
            row.createCell(3).setCellValue(excel.getEmail());
            row.createCell(4).setCellValue(excel.getPhone());
            row.createCell(5).setCellValue(excel.getGender());
            row.createCell(6).setCellValue(excel.getBirth());
            row.createCell(7).setCellValue(excel.getCount());
             
            rowIndex++;
        }



        // 셀 병합 CellRangeAddress(시작 행, 끝 행, 시작 열, 끝 열)
        worksheet.addMergedRegion(
                new CellRangeAddress(listExcel.size() + 1, listExcel.size() + 1, 0, 6));
         
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
