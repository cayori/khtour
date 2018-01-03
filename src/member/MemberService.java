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

	//���̵� ã��
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
			out.println("alert('�Է��Ͻ� ������ ��ġ�ϴ� ������ �����ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return LOGIN;
		}

		return SUCCESS;
	}

	//��й�ȣ ã��
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
			out.println("alert('�Է��Ͻ� ������ ��ġ�ϴ� ������ �����ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return LOGIN;
		}
		
		//�ӽú�й�ȣ�� 8�ڸ� ���� ����(����ҹ��� + ����)
		String pw = RandomStringUtils.random(8,"abcdefchijklmnopqrstuvwxyz0123456789");

		//ȸ���� ��й�ȣ�� ������ �ӽú�й�ȣ�� ����
		mvo.setPassword(pw);
		sqlMapper.update("updatePw", mvo);
		

		// ������ �ӽú�й�ȣ�� �ش� ȸ���� email�� ����
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.host", "smtp.gmail.com");//smtpȣ��Ʈ�� gmail�� ����
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.quitwait", "false");

		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("khtour8282@gmail.com", "");//�߼����� ���̵�� ��й�ȣ
			}
		};

		Session session = Session.getDefaultInstance(props, auth);

		MimeMessage message = new MimeMessage(session);
		message.setSender(new InternetAddress("khtour8282@gmail.com"));//�߽��ڼ���
		message.setSubject(id+" ȸ������ �ӽú�й�ȣ �߱� �����Դϴ�.");//�߽�����

		
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));

		Multipart mp = new MimeMultipart();
		MimeBodyPart mbp1 = new MimeBodyPart();
		mbp1.setText("ȸ������ �ӽú�й�ȣ�� "+pw+" �Դϴ�.\n\n��й�ȣ�� ��� �����Ͻñ� �ٶ��ϴ�.\n\n"
				+ "http://localhost:8080/khtour/LoginForm.action (KH���� �α���ȭ������ �̵�)");
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
		//����й�ȣ�� �Է��ߴٸ� ��й�ȣ ����, �Է����� ������ ��й�ȣ ���� ������ ����
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

	//������ �̵� �޼ҵ�
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
