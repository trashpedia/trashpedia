package com.kks.trashpedia.auth.model.service;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.auth.model.dao.AuthDao;
import com.kks.trashpedia.auth.model.dto.UserDetail;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AuthServiceImpl implements AuthService{

	@Value("${spring.mail.username}")
    private String setFrom;

    @Value("${spring.mail.host}")
    private String host;

    @Value("${spring.mail.port}")
    private String port;

    @Value("${spring.mail.username}")
    private String user;
    
    @Value("${spring.mail.password}")
    
    private String password;

    private String authNum;
    
	private final AuthDao authDao;
	
	@Override
	public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
		UserDetail userDetail =  (UserDetail) authDao.loadUserByUsername(userEmail);
		if(userDetail == null) {
			throw new UsernameNotFoundException("User not found with email: " + userEmail);
		} else {
			return (UserDetails) userDetail;
		}
	}
	
    public void createCode() {
        Random random = new Random();
        StringBuffer key = new StringBuffer();

        for (int i = 0; i < 8; i++) {
            int idx = random.nextInt(3);

            switch (idx) {
                case 0:
                    key.append((char) ((int) random.nextInt(26) + 97));
                    break;
                case 1:
                    key.append((char) ((int) random.nextInt(26) + 65));
                    break;
                case 2:
                    key.append(random.nextInt(9));
                    break;
            }
        }
        authNum = key.toString();
    }

    public MimeMessage createEmailForm(String userEmail) throws MessagingException, UnsupportedEncodingException {
        createCode();
        String toEmail = userEmail;
        String title = "trashpedia에서 발송한 인증번호";

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(setFrom));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        message.setSubject(title);

        String msgOfEmail = generateEmailContent(authNum);
        message.setContent(msgOfEmail, "text/html; charset=UTF-8");

        return message;
    }

    public String sendEmail(String userEmail) throws MessagingException, UnsupportedEncodingException {
        MimeMessage emailForm = createEmailForm(userEmail);
        Transport.send(emailForm, emailForm.getAllRecipients(), user, password);
        return authNum;
    }

    private String generateEmailContent(String authNum) {
        return "<div style='margin:20px;'>" +
                "<h1>안녕하세요 trashpedia 입니다.</h1>" +
                "<br>" +
                "<p>아래 코드를 입력해주세요.</p>" +
                "<br>" +
                "<p>감사합니다.</p>" +
                "<br>" +
                "<div align='center' style='border:1px solid black; font-family:verdana;'>" +
                "<h3 style='color:blue;'>회원가입 인증 코드입니다.</h3>" +
                "<div style='font-size:130%'>" +
                "CODE : <strong>" +
                authNum + "</strong></div><br/> " +
                "</div>";
    }

	@Override
	public int temporaryPwd(String userEmail, String phone) throws MessagingException, UnsupportedEncodingException {
		MimeMessage emailForm = createTemporaryPwdEmailForm(userEmail);
		String userPwd = authNum;
		int result = authDao.temporaryPwd(userEmail, phone, userPwd);
		System.out.println(result);
		if(result > 0) {
			Transport.send(emailForm, emailForm.getAllRecipients(), user, userPwd);
		}
		return result;
	}
	
	public MimeMessage createTemporaryPwdEmailForm(String userEmail) throws MessagingException, UnsupportedEncodingException {
        createCode();
        String toEmail = userEmail;
        String title = "trashpedia에서 발송한 임시 비밀번호";

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(setFrom));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        message.setSubject(title);

        String msgOfEmail = generatePwdContent(authNum);
        message.setContent(msgOfEmail, "text/html; charset=UTF-8");

        return message;
    }
	
    private String generatePwdContent(String authNum) {
        return "<div style='margin:20px;'>" +
                "<h1>안녕하세요 trashpedia 입니다.</h1>" +
                "<br>" +
                "<p>아래 임시 비밀번호를 보내드립니다.</p>" +
                "<p>로그인 후 마이페이지에서 비밀번호를 변경해주세요.</p>" +
                "<br>" +
                "<div align='center' style='border:1px solid black; font-family:verdana;'>" +
                "<h3 style='color:blue;'>임시 비밀번호입니다.</h3>" +
                "<div style='font-size:130%'>" +
                "CODE : <strong>" +
                authNum + "</strong></div><br/> " +
                "</div>";
    }
}