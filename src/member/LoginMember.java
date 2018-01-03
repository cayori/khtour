package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import air.AirVO;
import basket.BasketVO;
import basket.InBasket;
import hotel.HotelVO;
import item.ItemVO;
import order.OrderVO;

public class LoginMember extends ActionSupport{

	private static Reader reader;
	private static SqlMapClient sqlMapper;

	private MemberVO mvo = new MemberVO();

	private String id;
	private String password;

	private String name;
	private String email;
	private String email2;
	private int tel;

	private String saveid;

	private String bpassword;

	// ��ٱ���
	BasketVO bvo = new BasketVO();
	OrderVO ovo = new OrderVO();

	// ��ٱ��Ͽ� ��� ���� �ҷ��� �� �������� ������ �� ��ǰ�� ���
	ItemVO ivo = new ItemVO();
	HotelVO hvo = new HotelVO();
	AirVO avo = new AirVO();

	private int no;
	private int seq_no;
	private String air;
	private String room;
	private String hai;
	//

	public LoginMember() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {//�α���
		HttpServletResponse response = ServletActionContext.getResponse();

		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();
		Map<String, String> app = context.getApplication();

		mvo.setId(id);
		bpassword = (String) sqlMapper.queryForObject("membercheck", mvo);//�α����� �õ��� ���̵� ���� �н����带 ������

		if (bpassword == null) {//������ ��й�ȣ�� ���ٸ�
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('�ش� ���̵� �����ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return LOGIN;
		} else if (!bpassword.equals(password)) {//������ Ŭ���̾�Ʈ�� �Է��� ��й�ȣ�� �������� �ʴٸ�
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��й�ȣ�� ���� �ʽ��ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return LOGIN;
		}

		String admin = (String) sqlMapper.queryForObject("admincheck", mvo);//�ش� ���̵��� admin�� ������

		
		
		// �α��� �� �� ���ø����̼� ������ ����� �ش� ���̵� Ű�� ���� ���� �����ͼ�
		// �α����� �õ��� ���̵�� �� �� �����Ѵٸ� �α��� �Ұ�
		if (app.get(id) != null) {
			if (app.get(id).equals(id)) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				app.put("error", id);
				out.println("alert('�ش� �������� �α��� ���Դϴ�.');");
				out.println("location.href='Main.action'");
				out.println("</script>");
				out.close();
				return LOGIN;
			}
		}
		
		
		//�α����� �� ���ø����̼� ������ �ߺ� Ȯ�ο� Ű ����, ���ǿ� ���̵� ����, ���ǿ� ������ ȸ�� �����ϱ� ���� �� ����
		app.put(id, id);
		session.put("id", id);
		session.put("admincheck", admin);
		
		sqlMapper.update("updatechon", session.get("id"));
		
		return SUCCESS;
	}
	

	public String logout() throws Exception {//�α׾ƿ� �ÿ��� ���ǰ� ���ø����̼� ������ ���̵��� ����
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();

		Map<String, String> app = context.getApplication();
		sqlMapper.update("updatechoff", session.get("id"));//ch���� 0(��α��� ����)�� ����

		session.remove("id");
		session.remove("admincheck");
		app.remove(id);

		context.setSession(session);
		

		return SUCCESS;
	}
	
	public void cc() throws Exception{//�ߺ��α����� �߻��ϸ� �ǽð����� ���â�� �α����� ȸ������ ����ִ� �޼ҵ�
		HttpServletResponse response = ServletActionContext.getResponse();
		
		ActionContext context = ActionContext.getContext();
		Map<String, String> app = context.getApplication();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		app.remove("error");
		out.println("alert('�ذ��� ȸ������ �������� �α����� �õ��Ǿ����ϴ�.');");
		out.println("</script>");
		out.close();
	}
		
	
	public void subcc() throws Exception{}//�ߺ� �α��� üũ �帧�޾��ִ� �޼ҵ�

	
	// ���������� �� �� ������ ���� ��������
	public String ModifyMemberForm() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();

		mvo.setId(id);

		String chpw = (String) sqlMapper.queryForObject("membercheck", mvo);

		// �Է��� ��й�ȣ�� �ش� ȸ���� ��й�ȣ�� ��ġ���� ������ �������� ����
		if (!password.equals(chpw)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return LOGIN;
		}

		name = (String) sqlMapper.queryForObject("selectname", mvo);
		email = (String) sqlMapper.queryForObject("selectemail", mvo);
		tel = (int) sqlMapper.queryForObject("selecttel", mvo);

		String[] e = email.split("@");

		email = e[0];
		email2 = e[1];

		return SUCCESS;
	}

	public String delete() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();

		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();

		Map<String, String> app = context.getApplication();

		mvo.setId(id);
		ovo.setId(id);

		String chpw = (String) sqlMapper.queryForObject("membercheck", mvo);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		// �Է��� ��й�ȣ�� �ش� ȸ���� ��й�ȣ�� ��ġ���� ������ Ż���Ű�� ����
		if (!password.equals(chpw)) {
			out.println("<script>");
			out.println("alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return LOGIN;
		}

		sqlMapper.delete("deleteallorder", ovo);
		sqlMapper.delete("deletemember", mvo);

		app.remove("appid");
		session.remove("id");
		session.remove("admincheck");
		
		context.setSession(session);
		
		out.println("<script>");
		out.println("alert('���������� Ż��Ǿ����ϴ�.');");
		out.println("window.location.replace('Main.action');");
		out.println("</script>");
		out.close();

		return SUCCESS;
	}
	
	// ���ϴ� ��ǰ�� ��ٱ��Ͽ� ���� �� �ش� ��ǰ�� ���̺��� ��ٱ��� ���̺�� �����̵�
	public String insertBasket() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();

		InBasket ib = new InBasket();

		if (hai != null) {//haiĮ���� �����ǰ���� �����Ѵ�.
			ivo.setNo(no);
			ivo = (ItemVO) sqlMapper.queryForObject("selectitem", ivo);

			bvo = ib.itemBasket(ivo);
		} else if (room != null) {//roomĮ���� ȣ�ڻ�ǰ���� �����Ѵ�.
			hvo.setNo(no);
			hvo = (HotelVO) sqlMapper.queryForObject("selecthotel", hvo);

			bvo = ib.hotelBasket(hvo);
		} else if (air != null) {//airĮ���� �װ���ǰ���� �����Ѵ�.
			avo.setNo(no);
			avo = (AirVO) sqlMapper.queryForObject("selectair", avo);

			bvo = ib.airBasket(avo);
		}

		bvo.setId(session.get("id"));//ȸ������ ��ٱ��ϸ� �����ϱ� ����

		sqlMapper.insert("putbasket", bvo);

		return SUCCESS;
	}
	
	
	// �Ʒ� 4���� �޼ҵ�� �ϳ��� �ᵵ ����
	// ���ο��� ��ٷ� ��ٱ��Ϸ� �� �� ���� id���� ������ BasketList�� ��
	public String basketForm() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();
		id = session.get("id");

		return SUCCESS;
	}

	public String form() throws Exception {// �α��������� �̵��� �� ��ġ��
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();
		session.remove("id");
		return SUCCESS;
	}

	public String ModifyMemberCheck() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();
		id = session.get("id");
		return SUCCESS;
	}

	public String DeleteMemberCheck() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();
		id = session.get("id");
		return SUCCESS;
	}
	
	

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		LoginMember.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		LoginMember.sqlMapper = sqlMapper;
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

	public String getSaveid() {
		return saveid;
	}

	public void setSaveid(String saveid) {
		this.saveid = saveid;
	}

	public String getBpassword() {
		return bpassword;
	}

	public void setBpassword(String bpassword) {
		this.bpassword = bpassword;
	}

	public BasketVO getBvo() {
		return bvo;
	}

	public void setBvo(BasketVO bvo) {
		this.bvo = bvo;
	}

	public ItemVO getIvo() {
		return ivo;
	}

	public void setIvo(ItemVO ivo) {
		this.ivo = ivo;
	}

	public HotelVO getHvo() {
		return hvo;
	}

	public void setHvo(HotelVO hvo) {
		this.hvo = hvo;
	}

	public AirVO getAvo() {
		return avo;
	}

	public void setAvo(AirVO avo) {
		this.avo = avo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSeq_no() {
		return seq_no;
	}

	public void setSeq_no(int seq_no) {
		this.seq_no = seq_no;
	}

	public String getAir() {
		return air;
	}

	public void setAir(String air) {
		this.air = air;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getHai() {
		return hai;
	}

	public void setHai(String hai) {
		this.hai = hai;
	}

	public OrderVO getOvo() {
		return ovo;
	}

	public void setOvo(OrderVO ovo) {
		this.ovo = ovo;
	}

}
