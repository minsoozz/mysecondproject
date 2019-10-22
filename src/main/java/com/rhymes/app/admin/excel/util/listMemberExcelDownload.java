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

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.payment.model.PaymentDTO;

public class listMemberExcelDownload extends AbstractXlsxView {

	@Override
	protected void buildExcelDocument(Map<String, Object> modelMap, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String sCurTime = null;
        sCurTime = new SimpleDateFormat("yyyyMMdd", Locale.KOREA).format(new Date());
     
        String excelName = sCurTime + "RHYMESb 결제내역_엑셀다운로드.xlsx";
        Sheet worksheet_p = null;
        Sheet worksheet_c = null;
        Row row_p = null;
        Row row_c = null;
        CellStyle style = workbook.createCellStyle(); // 셀 스타일을 위한 변수
        style.setAlignment(CellStyle.ALIGN_CENTER); // 글 위치를 중앙으로 설정
         
        List<P_MemberDTO> mem_p_list = (List<P_MemberDTO>)modelMap.get("mem_p_list");
        List<SellerDTO> mem_c_list = (List<SellerDTO>)modelMap.get("mem_c_list");
         
        // 새로운 sheet를 생성한다.
        worksheet_p = workbook.createSheet("개인 회원 정보");
        worksheet_c = workbook.createSheet("사업자 회원 정보");
         
        // 가장 첫번째 줄에 제목을 만든다.
        row_p = worksheet_p.createRow(0);
        row_c = worksheet_c.createRow(0);
         
        // 칼럼 길이 설정
        int columnIndex = 0;
        while (columnIndex < 12) {             
            if(columnIndex == 0) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 1) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 2) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 3) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 4) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 5) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 6) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 7) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 8) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 9) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 10) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }else if (columnIndex == 11) {
            	worksheet_p.setColumnWidth(columnIndex, 5000);
            }
            columnIndex++;
        }


        // 헤더 설정
        row_p = worksheet_p.createRow(0);
        row_p.createCell(0).setCellValue("SEQ");
        row_p.createCell(1).setCellValue("ID");
        row_p.createCell(2).setCellValue("NAME");
        row_p.createCell(3).setCellValue("POSTCODE");
        row_p.createCell(4).setCellValue("ADDRESS");
        row_p.createCell(5).setCellValue("DETAILADDRESS");
        row_p.createCell(6).setCellValue("EMAIL");
        row_p.createCell(7).setCellValue("PHONE");
        row_p.createCell(8).setCellValue("GENDER");
        row_p.createCell(9).setCellValue("BIRTH");
        row_p.createCell(10).setCellValue("COUNT");
        row_p.createCell(11).setCellValue("subscribe");
         
        int rowIndex = 1;
        
        // 각 해당하는 셀에 값과 스타일을 넣음
        for(P_MemberDTO mem_p : mem_p_list) {
        	row_p = worksheet_p.createRow(rowIndex);
        	row_p.createCell(0).setCellValue(mem_p.getSeq());
        	row_p.createCell(1).setCellValue(mem_p.getUserid());
        	row_p.createCell(2).setCellValue(mem_p.getUsername());
        	row_p.createCell(3).setCellValue(mem_p.getPostcode());
        	row_p.createCell(4).setCellValue(mem_p.getAddress());
        	row_p.createCell(5).setCellValue(mem_p.getDetailAddress());
        	row_p.createCell(6).setCellValue(mem_p.getUseremail());
            row_p.createCell(7).setCellValue(mem_p.getPhone());
            row_p.createCell(8).setCellValue(mem_p.getUsergender());
            row_p.createCell(9).setCellValue(mem_p.getUserbirth());
            row_p.createCell(10).setCellValue(mem_p.getCount());
            row_p.createCell(11).setCellValue(mem_p.getSubscribe());
             
            rowIndex++;
        }



        // 셀 병합 CellRangeAddress(시작 행, 끝 행, 시작 열, 끝 열)
        worksheet_p.addMergedRegion(
                new CellRangeAddress(mem_p_list.size() + 1, mem_p_list.size() + 1, 0, 20));
         
        // 병합 테스트를 위한 설정
        row_p = worksheet_p.createRow(mem_p_list.size() + 1);
        row_p.createCell(0).setCellValue("셀 병합 테스트");
        row_p.getCell(0).setCellStyle(style); // 지정한 스타일을 입혀준다.
         
         
        try {
            response.setHeader("Content-Disposition", "attachement; filename=\""
                + java.net.URLEncoder.encode(excelName, "UTF-8") + "\";charset=\"UTF-8\"");
          } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
          }
   
        
        
	
	}
	
}
