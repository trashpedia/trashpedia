package com.kks.trashpedia.auth.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Properties;
import java.util.Random;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.auth.model.dao.AuthDao;
import com.kks.trashpedia.auth.model.dto.UserDetail;
import com.nimbusds.jose.shaded.gson.JsonElement;
import com.nimbusds.jose.shaded.gson.JsonParser;

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

    @Value("${kakao.client.id}")
    private String KAKAO_CLIENT_ID;

    @Value("${kakao.client.secret}")
    private String KAKAO_CLIENT_SECRET;

    @Value("${kakao.redirect.uri}")
    private String KAKAO_REDIRECT_URI;
	
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
		if(result > 0) {
			Transport.send(emailForm, emailForm.getAllRecipients(), user, password);
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

	@Override
	public String kakaoUrl() {
		return "https://kauth.kakao.com/oauth/authorize"
                + "?client_id=" + KAKAO_CLIENT_ID
                + "&redirect_uri=" + KAKAO_REDIRECT_URI
                + "&response_type=code";
	}

	@Override
	public String kakaoGetToken(String code) {
		String access_Token = "";
    	String refresh_Token = "";
    	String reqURL = "https://kauth.kakao.com/oauth/token";
    	
    	try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            String jsonInputString = "grant_type=authorization_code"
                + "&client_id=" + URLEncoder.encode(KAKAO_CLIENT_ID, "UTF-8")
                + "&redirect_uri=" + URLEncoder.encode(KAKAO_REDIRECT_URI, "UTF-8")
                + "&client_secret=" + URLEncoder.encode(KAKAO_CLIENT_SECRET, "UTF-8")
                + "&code=" + URLEncoder.encode(code, "UTF-8");

            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("UTF-8");
                os.write(input, 0, input.length);
            }

            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
                StringBuilder response = new StringBuilder();
                String responseLine = null;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }

                JsonElement element = JsonParser.parseString(response.toString());
                access_Token = element.getAsJsonObject().get("access_token").getAsString();
                refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_Token;
	}
}