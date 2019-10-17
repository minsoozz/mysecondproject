package com.rhymes.app.payment.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.rhymes.app.payment.model.PaymentDTO;

// 결제 후 주문한 이메일로 결제내역 보내기 폼도 있는 것
public class PaymentEmail {
	
    static final String FROM = "ysujin17@naver.com";
    static final String FROMNAME = "Rhymes";
    static final String TO = "onep577@naver.com";
 
    static final String SMTP_USERNAME = "ysujin17@naver.com";
    static final String SMTP_PASSWORD = "rhymes127";
    
    static final String HOST = "smtp.naver.com";
    static final int PORT = 465;
    
    static final String SUBJECT = "메일 제목";
    
    private static int totalprice;
    private static String payment_code;
    private static String payment_status;
    private static String payment_method;
    private static String receive_name;
    private static String receive_phone;
    private static String receive_postnum;
    private static String receive_address;
    private static String receive_address_request;

    public static String email_send() {
    	String body =
    			
        "<div style='text-align: left; padding-top: 10px; padding-bottom: 50px; width: 50%;'>"+
        "<div style='margin-bottom: 50px;'>"+
        "<h1>RHYMESb 쇼핑몰 결제내역입니다. 총 주문금액 : "+totalprice+"원</h1>"+
//    	        
//    	        "<div style='padding-bottom: 50px;'>"+
//    	        "<b style='font-family: sans-serif; font-size: 20px; text-align: left;'>결제금액 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>"+
//    	        "<b style='font-family: sans-serif; font-size: 30px; text-align: right; color: red;'>"+totalprice+"원</b>"+
//    	        "</div>"+
		"<div>"+
        "<div>"+
        "<b style='font-family: sans-serif; font-size: 15px;'>결제방법</b>"+
        "</div>"+
        "<div>"+
        "<table class='paymentAf_tb' border='1' style='width: 100%; margin: 10px 10px 10px 10px;'>"+
        "<tr>"+
        	"<th style='padding: 10px 10px 10px 10px;'>결제금액</th>"+
        	"<th style='padding: 10px 10px 10px 10px;'>결제고유번호</th>"+
        	"<th style='padding: 10px 10px 10px 10px;'>결제상태</th>"+
        	"<th style='padding: 10px 10px 10px 10px;'>결제수단</th>"+
        "</tr>"+
        "<tr>"+
        	"<td style='padding: 10px 10px 10px 10px;'>"+totalprice+"원</td>"+
        	"<td style='padding: 10px 10px 10px 10px;'>"+payment_code+"</td>"+
        	"<td style='padding: 10px 10px 10px 10px;'>"+payment_status+"</td>"+
        	"<td style='padding: 10px 10px 10px 10px;'>"+payment_method+"</td>"+

        "</tr>"+
        "</table>"+
        "</div>"+
        "<br><br>"+

        "<div>"+
        "<b style='font-family: sans-serif; font-size: 15px;'>배송지 정보</b>"+
        "</div>"+
        "<div>"+
        "<table class='paymentAf_tb' border='1' style='width: 100%; margin: 10px 10px 10px 10px;'>"+
        "<tr>"+
        	"<th style='padding: 10px 10px 10px 10px;'>이름</th>"+
        	"<td style='padding: 10px 10px 10px 10px;'>"+receive_name+"</td>"+
        	"<th style='padding: 10px 10px 10px 10px;'>연락처</th>"+
        	"<td style='padding: 10px 10px 10px 10px;'>"+receive_phone+"</td>"+
        "</tr>"+
        "<tr>"+
        	"<th style='padding: 10px 10px 10px 10px;'>우편번호</th>"+
        	"<td style='padding: 10px 10px 10px 10px;'>"+receive_postnum+"</td>"+
        	"<th style='padding: 10px 10px 10px 10px;'>주소</th>"+
        	"<td style='padding: 10px 10px 10px 10px;'>"+receive_address+"</td>"+
        "</tr>"+
        "<tr>"+
        	"<th style='padding: 10px 10px 10px 10px;'>주문시 요청사항</th>"+
        	"<td colspan='3' style='padding: 10px 10px 10px 10px;'>"+receive_address_request+"</td>"+
        "</tr>"+
        "</table>"+
        "</div>"+
        "</div>";

    	return body;
    }
    
    public static void PaymentEmailSend(PaymentDTO dto) throws Exception {
    	totalprice = dto.getTotalprice();
    	payment_code = dto.getPayment_code();
    	payment_status = dto.getPayment_status();
    	payment_method = dto.getPayment_method();
    	receive_name = dto.getReceive_name();
    	receive_phone = dto.getReceive_phone();
    	receive_postnum = dto.getReceive_postnum();
    	receive_address = dto.getReceive_address();
    	receive_address_request = dto.getReceive_address_request();
    	
    	String body = email_send();
    	
        Properties props = System.getProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.port", PORT); 
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
 
        Session session = Session.getDefaultInstance(props);
 
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(FROM, FROMNAME));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
        msg.setSubject(SUBJECT);
        //msg.setContent(BODY, "text/html;charset=euc-kr");
        msg.setContent(body, "text/html;charset=euc-kr");
        
        Transport transport = session.getTransport();
 
        try {
            System.out.println("Sending...");
            
            transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
            transport.sendMessage(msg, msg.getAllRecipients());
 
            System.out.println("Email sent!");
        } catch (Exception ex) {
            ex.printStackTrace();
 
        } finally {
            transport.close();
        }
    }

}
