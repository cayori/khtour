package admin;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import member.MemberVO;

public class AdminMemberList extends ActionSupport{
	
	private static Reader reader; // 파일 스트림을 위한 reader.
	private static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private List adminmemberlist = new ArrayList();
	
	private MemberVO mvo = new MemberVO();
	
	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 10; // 한 페이지의 게시물의 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private AdminMemberpagingAction page; // 페이징 클래스
	private String search;
	private String n;
	private String[] kind = { "id", "name", "email", "tel" };
	private String ch;

	
	
	public AdminMemberList() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// 지정된 리더를 사용하여 SqlMapClient를 빌드합니다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	public String execute() throws Exception{
		if (search == null) { search = ""; }//검색어
		if (n == null) { n = "0"; }//검색 셀렉트문 
		if (ch == null) { ch = "-1"; }//접속, 비접속 구분
		
		mvo.setSearch(getSearch());
		mvo.setSearchn(kind[Integer.parseInt(getN())]);
		mvo.setCh(ch);
		adminmemberlist = sqlMapper.queryForList("searchorallmember", mvo);
		
		totalCount = adminmemberlist.size();
		
		if(currentPage==0){ currentPage = 1; }
		page = new AdminMemberpagingAction(currentPage, totalCount, blockCount, blockPage, search, Integer.parseInt(n));
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		adminmemberlist = adminmemberlist.subList(page.getStartCount(), lastCount);// page.getStartCount()의

		return SUCCESS;
	}
	
	
	
	public String adminForm() throws Exception{
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		AdminMemberList.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminMemberList.sqlMapper = sqlMapper;
	}

	public List getAdminmemberlist() {
		return adminmemberlist;
	}

	public void setAdminmemberlist(List adminmemberlist) {
		this.adminmemberlist = adminmemberlist;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public MemberVO getMvo() {
		return mvo;
	}


	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}


	public String getCh() {
		return ch;
	}


	public void setCh(String ch) {
		this.ch = ch;
	}


	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public AdminMemberpagingAction getPage() {
		return page;
	}

	public void setPage(AdminMemberpagingAction page) {
		this.page = page;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getN() {
		return n;
	}

	public void setN(String n) {
		this.n = n;
	}

	public String[] getKind() {
		return kind;
	}

	public void setKind(String[] kind) {
		this.kind = kind;
	}
	
}
