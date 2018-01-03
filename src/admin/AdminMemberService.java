package admin;

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

import member.MemberVO;

public class AdminMemberService extends ActionSupport {
	
	private static Reader reader;
	private static SqlMapClient sqlMapper;
	
	private MemberVO mvo = new MemberVO();
	
	private String id;
	private String name;
	private String email;
	private String email2;
	private int tel;
	
	
	public AdminMemberService() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// 지정된 리더를 사용하여 SqlMapClient를 빌드합니다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	public String execute() throws Exception{
		
		mvo.setId(id);
		
		name = (String)sqlMapper.queryForObject("selectname", mvo);
		email = (String)sqlMapper.queryForObject("selectemail", mvo);
		tel = (int)sqlMapper.queryForObject("selecttel", mvo);
		
		String[] e = email.split("@");
		
		email = e[0];
		email2 = e[1];
		
		return SUCCESS;
	}
	
	
	public String delete() throws Exception{
		//회원탈퇴 구현하자 (이건 세션 리무브를 하면 안되기 때문에 따로 구현하는 것임)
		HttpServletResponse response = ServletActionContext.getResponse();

		mvo.setId(id);

		if (mvo.getId()!=null) {
			sqlMapper.delete("deletemember", mvo);
			return SUCCESS;
		}
		
		
		return SUCCESS;
	}
	
	
	
	
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		AdminMemberService.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminMemberService.sqlMapper = sqlMapper;
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

}
