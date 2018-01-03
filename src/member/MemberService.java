package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.Map;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.struts2.ServletActionContext;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MemberService extends ActionSupport {

	private Reader reader;
	private SqlMapClient sqlMapper;

	private MemberVO mvo = new MemberVO();

	private String id;
	private String password;
	private String newpassword;

	private String name;
	private String email;
	private String email2;
	private int tel;
	private int admin;

	public MemberService() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	//아이디 찾기
	public String execute() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		
		email = email + "@" + email2;
		
		mvo.setName(name);
		mvo.setEmail(email);
		id = (String) sqlMapper.queryForObject("findId", mvo);

		if (id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력하신 정보와 일치하는 계정이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return LOGIN;
		}

		return SUCCESS;
	}

	//비밀번호 찾기
	public String findPw() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		
		email = email + "@" + email2;

		mvo.setId(id);
		mvo.setEmail(email);

		password = (String) sqlMapper.queryForObject("findPw", mvo);

		if (password == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력하신 정보와 일치하는 계정이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return LOGIN;
		}
		
		//임시비밀번호인 8자리 난수 생성(영대소문자 + 숫자)
		String pw = RandomStringUtils.random(8,"abcdefchijklmnopqrstuvwxyz0123456789");

		//회원의 비밀번호를 생성한 임시비밀번호로 변경
		mvo.setPassword(pw);
		sqlMapper.update("updatePw", mvo);
		

		// 생성한 임시비밀번호를 해당 회원의 email로 전송
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.host", "smtp.gmail.com");//smtp호스트를 gmail로 설정
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.quitwait", "false");

		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("khtour8282@gmail.com", "");//발송인의 아이디와 비밀번호
			}
		};

		Session session = Session.getDefaultInstance(props, auth);

		MimeMessage message = new MimeMessage(session);
		message.setSender(new InternetAddress("khtour8282@gmail.com"));//발신자설정
		message.setSubject(id+" 회원님의 임시비밀번호 발급 메일입니다.");//발신제목

		
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));

		Multipart mp = new MimeMultipart();
		MimeBodyPart mbp1 = new MimeBodyPart();
		mbp1.setText("회원님의 임시비밀번호는 "+pw+" 입니다.\n\n비밀번호를 즉시 변경하시기 바랍니다.\n\n"
				+ "http://localhost:8080/khtour/LoginForm.action (KH투어 로그인화면으로 이동)");
		mp.addBodyPart(mbp1);

		MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
		mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
		mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
		mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
		mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
		mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
		CommandMap.setDefaultCommandMap(mc);

		message.setContent(mp);
		
		Transport.send(message);

		return SUCCESS;
	}
	
	
	public String modifyMember() throws Exception {
		mvo.setId(id);
		//새비밀번호를 입력했다면 비밀번호 변경, 입력하지 않으면 비밀번호 외의 정보만 수정
		if(newpassword != null || newpassword != ""){
			mvo.setNewpassword(newpassword);
		}
		
		email=email+"@"+email2;
		mvo.setEmail(email);
		mvo.setTel(tel);
		mvo.setAdmin(admin);
		
		sqlMapper.update("updateMember", mvo);
	
		mvo.setAdmin(admin);
		
		

		return SUCCESS;
	}

	//페이지 이동 메소드
	public String mypageForm() throws Exception {
		return SUCCESS;
	}

	public String MemberManageForm() throws Exception {
		return SUCCESS;
	}

	public String FindForm() throws Exception {
		return SUCCESS;
	}

	public String Id() throws Exception {
		return SUCCESS;
	}
	////

	
	
	public Reader getReader() {
		return reader;
	}

	public void setReader(Reader reader) {
		this.reader = reader;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public MemberVO getMvo() {
		return mvo;
	}

	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public int getTel() {
		return tel;
	}

	public void setTel(int tel) {
		this.tel = tel;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

}
