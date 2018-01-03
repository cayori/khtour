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

	// 장바구니
	BasketVO bvo = new BasketVO();
	OrderVO ovo = new OrderVO();

	// 장바구니에 담기 위해 불러올 때 정보들을 저장할 각 상품의 빈들
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

	public String execute() throws Exception {//로그인
		HttpServletResponse response = ServletActionContext.getResponse();

		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();
		Map<String, String> app = context.getApplication();

		mvo.setId(id);
		bpassword = (String) sqlMapper.queryForObject("membercheck", mvo);//로그인을 시도한 아이디가 가진 패스워드를 꺼내옴

		if (bpassword == null) {//꺼내온 비밀번호가 없다면
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('해당 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return LOGIN;
		} else if (!bpassword.equals(password)) {//있지만 클라이언트가 입력한 비밀번호가 동일하지 않다면
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 맞지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return LOGIN;
		}

		String admin = (String) sqlMapper.queryForObject("admincheck", mvo);//해당 아이디의 admin값 꺼내옴

		
		
		// 로그인 할 때 어플리케이션 영역에 저장된 해당 아이디를 키로 갖는 값을 가져와서
		// 로그인을 시도한 아이디와 비교 후 존재한다면 로그인 불가
		if (app.get(id) != null) {
			if (app.get(id).equals(id)) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				app.put("error", id);
				out.println("alert('해당 계정으로 로그인 중입니다.');");
				out.println("location.href='Main.action'");
				out.println("</script>");
				out.close();
				return LOGIN;
			}
		}
		
		
		//로그인할 때 어플리케이션 영역에 중복 확인용 키 저장, 세션에 아이디 저장, 세션에 관리자 회원 구분하기 위한 값 저장
		app.put(id, id);
		session.put("id", id);
		session.put("admincheck", admin);
		
		sqlMapper.update("updatechon", session.get("id"));
		
		return SUCCESS;
	}
	

	public String logout() throws Exception {//로그아웃 시에는 세션과 어플리케이션 영역의 아이디값을 제거
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();

		Map<String, String> app = context.getApplication();
		sqlMapper.update("updatechoff", session.get("id"));//ch값을 0(비로그인 상태)로 갱신

		session.remove("id");
		session.remove("admincheck");
		app.remove(id);

		context.setSession(session);
		

		return SUCCESS;
	}
	
	public void cc() throws Exception{//중복로그인이 발생하면 실시간으로 경고창을 로그인한 회원에게 띄워주는 메소드
		HttpServletResponse response = ServletActionContext.getResponse();
		
		ActionContext context = ActionContext.getContext();
		Map<String, String> app = context.getApplication();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		app.remove("error");
		out.println("alert('※경고※ 회원님의 계정으로 로그인이 시도되었습니다.');");
		out.println("</script>");
		out.close();
	}
		
	
	public void subcc() throws Exception{}//중복 로그인 체크 흐름받아주는 메소드

	
	// 수정폼으로 갈 때 보여줄 정보 가져가기
	public String ModifyMemberForm() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();

		mvo.setId(id);

		String chpw = (String) sqlMapper.queryForObject("membercheck", mvo);

		// 입력한 비밀번호와 해당 회원의 비밀번호가 일치하지 않으면 수정하지 않음
		if (!password.equals(chpw)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
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
		// 입력한 비밀번호와 해당 회원의 비밀번호가 일치하지 않으면 탈퇴시키지 않음
		if (!password.equals(chpw)) {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
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
		out.println("alert('정상적으로 탈퇴되었습니다.');");
		out.println("window.location.replace('Main.action');");
		out.println("</script>");
		out.close();

		return SUCCESS;
	}
	
	// 원하는 상품을 장바구니에 넣을 때 해당 상품의 테이블에서 장바구니 테이블로 정보이동
	public String insertBasket() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();

		InBasket ib = new InBasket();

		if (hai != null) {//hai칼럼은 여행상품에만 존재한다.
			ivo.setNo(no);
			ivo = (ItemVO) sqlMapper.queryForObject("selectitem", ivo);

			bvo = ib.itemBasket(ivo);
		} else if (room != null) {//room칼럼은 호텔상품에만 존재한다.
			hvo.setNo(no);
			hvo = (HotelVO) sqlMapper.queryForObject("selecthotel", hvo);

			bvo = ib.hotelBasket(hvo);
		} else if (air != null) {//air칼럼은 항공상품에만 존재한다.
			avo.setNo(no);
			avo = (AirVO) sqlMapper.queryForObject("selectair", avo);

			bvo = ib.airBasket(avo);
		}

		bvo.setId(session.get("id"));//회원별로 장바구니를 구별하기 위해

		sqlMapper.insert("putbasket", bvo);

		return SUCCESS;
	}
	
	
	// 아래 4개의 메소드는 하나로 써도 무방
	// 메인에서 곧바로 장바구니로 갈 때 세션 id값을 가지고 BasketList로 감
	public String basketForm() throws Exception {
		ActionContext context = ActionContext.getContext();
		Map<String, String> session = context.getSession();
		id = session.get("id");

		return SUCCESS;
	}

	public String form() throws Exception {// 로그인폼으로 이동할 때 거치는
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
