package air;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class ListAir extends ActionSupport {

	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper 객체

	private List<AirVO> alist = new ArrayList<AirVO>();
	private AirVO avo = new AirVO();
	
	private int price;
	private int no;

	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 9; // 한 페이지의 게시물의 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private AirpagingAction page; // 페이징 클래스
	private String search;
	private String n;
	private String[] kind = {"reg_date", "grade", "ltprice", "price" };

	// 생성자
	public ListAir() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// 지정된 리더를 사용하여 SqlMapClient를 빌드합니다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		if (search == null) { search = ""; }
		if (n == null) { n = "0"; }//카테고리별 정렬
			avo.setPrice(price);
		    avo.setSearch(getSearch());
		    avo.setSearchn(kind[Integer.parseInt(getN())]);
		    alist = sqlMapper.queryForList("listAir", avo);
		    
		
		totalCount = alist.size();
		
		if(currentPage==0){ currentPage = 1; }
		page = new AirpagingAction(currentPage, totalCount, blockCount, blockPage, search, n);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		alist = alist.subList(page.getStartCount(), lastCount);// page.getStartCount()의

		return SUCCESS;
	}
	
	
	public String seatForm() throws Exception{
		return SUCCESS;
	}
	
	
	
	

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ListAir.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ListAir.sqlMapper = sqlMapper;
	}

	public List<AirVO> getAlist() {
		return alist;
	}

	public void setAlist(List<AirVO> alist) {
		this.alist = alist;
	}

	public AirVO getAvo() {
		return avo;
	}

	public void setAvo(AirVO avo) {
		this.avo = avo;
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

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public AirpagingAction getPage() {
		return page;
	}

	public void setPage(AirpagingAction page) {
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
}