package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.Calendar;
import java.util.Date;
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

import org.apache.struts2.ServletActionContext;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class JoinMember extends ActionSupport {

	private static Reader reader;
	private static SqlMapClient sqlMapper;

	private int no;
	private String id;
	private String password;
	private String password2;
	private String name;
	private String email;
	private String email2;
	private int tel;
	private int admin;
	private Date regdate;

	private String confirmidcheck;
	private String confirmemail;

	private MemberVO mvo = new MemberVO();

	Calendar today = Calendar.getInstance();

	public JoinMember() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}

	public String execute() throws Exception {
		
		//메일인증을 통해 admin값이 5로 전달된다면 회원가입폼에서 입력했던 정보를 데이터베이스에 저장
		if (admin == 5) {

			mvo.setId(id);
			mvo.setPassword(password);
			mvo.setName(name);
			mvo.setEmail(email);
			mvo.setTel(tel);
			mvo.setAdmin(0);
			mvo.setRegdate(today.getTime());
			mvo.setCh("0");

			sqlMapper.insert("insertmember", mvo);

			sqlMapper.update("commit");
			return SUCCESS;
		}
		
		return ERROR;
	}

	public String confirmId() throws Exception {
		mvo.setId(id);

		String confirmid = (String) sqlMapper.queryForObject("confirmid", mvo);

		if (confirmid == null) {//중복확인을 통과했다면 중복체크값을 yes로
			confirmidcheck = "yes";
		} else {//중복확인을 통과하지 못했다면 중복체크값을 no로
			confirmidcheck = "no";
		}
		return SUCCESS;
	}

	public String confirmEmail() throws Exception {//회원가입 이메일 인증
		HttpServletResponse response = ServletActionContext.getResponse();

		email = email + "@" + email2;

		mvo.setEmail(email);

		//회원가입 정보 입력시 입력한 이메일과 동일한 이메일이 데이터베이스에 존재하는지 확인
		confirmemail = (String) sqlMapper.queryForObject("confirmemail", mvo);

		if (confirmemail != null) {//동일한 이메일이 존재한다면 가입불가
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('동일한 이메일이 존재합니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return LOGIN;
		}
		
		//동일한 이메일이 없다면 회원가입인증용 메일 발송
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.quitwait", "false");

		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("khtour8282@gmail.com", "");//발신자 이메일과 비밀번호 입력
			}
		};

		Session session = Session.getDefaultInstance(props, auth);

		MimeMessage message = new MimeMessage(session);
		message.setSender(new InternetAddress("khtour8282@gmail.com"));
		message.setSubject("회원가입 이메일 인증 메일입니다.");

		message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
		
		//회원가입폼에서 입력한 정보를 노출되지않게 a태그로 발송
		//여기를 누르면 해당 값이 가입로직으로 전달됨
		String confirmUrl = "<a href='http://localhost:8080/khtour/JoinMember.action?email=" + email + "&id=" + id
				+ "&password=" + password + "&name=" + name + "" + "&tel=" + tel + "&admin=5'>여기</a>를 누르시면 회원가입이 완료됩니다.";

		Multipart mp = new MimeMultipart();
		MimeBodyPart mbp1 = new MimeBodyPart();
		mbp1.setContent(confirmUrl, "text/html;charset=UTF-8");
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

	public String form() throws Exception {
		return SUCCESS;
	}
	
	
	public String emailform() throws Exception{
		return SUCCESS;
	}
	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
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

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public MemberVO getMvo() {
		return mvo;
	}

	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		JoinMember.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		JoinMember.sqlMapper = sqlMapper;
	}

	public String getConfirmidcheck() {
		return confirmidcheck;
	}

	public void setConfirmidcheck(String confirmidcheck) {
		this.confirmidcheck = confirmidcheck;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

}
