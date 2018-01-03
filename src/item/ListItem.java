package item;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class ListItem extends ActionSupport {
	public static Reader reader; // 파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한 sqlMapper
											// 객체

	private List<ItemVO> Itemlist = new ArrayList<ItemVO>();
	private ItemVO ivo = new ItemVO();

	private int currentPage = 1; // 현재 페이지
	private int totalCount; // 총 게시물의 수
	private int blockCount = 9; // 한 페이지의 게시물의 수
	private int blockPage = 5; // 한 화면에 보여줄 페이지 수
	private String pagingHtml; // 페이징을 구현한 HTML
	private ItempagingAction page; // 페이징 클래스
	private String search;// region칼럼,content 에 넣어서 비교, 내용
	private String n;
	private String[] kind = { "reg_date", "ltprice", "price", "grade" };
	
	private int r;
	
	private String[] area = { "", "서울", "부산", "전주", "경주", "제주", "강원" };

	private List lately = new ArrayList();
	private List latelyno = new ArrayList();
	private List latelyname = new ArrayList();
	
	private int no1;
	private int no2;
	private int no3;
	private String i1;
	private String i2;
	private String i3;
	private String name1;
	private String name2;
	private String name3;

	// 생성자
	public ListItem() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// 지정된 리더를 사용하여 SqlMapClient를 빌드합니다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		if (search == null) {search = "";}
		if (n == null) {n = "0";}
			ivo.setSearch(getSearch());
			ivo.setSearchn(kind[Integer.parseInt(n)]);
			ivo.setArea(area[r]);
			Itemlist = sqlMapper.queryForList("searchitem", ivo);

			
			
		totalCount = Itemlist.size();

		if (currentPage == 0) {
			currentPage = 1;
		}
		page = new ItempagingAction(currentPage, totalCount, blockCount, blockPage, search, n);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		Itemlist = Itemlist.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}

	public String late() throws Exception {
		lately = sqlMapper.queryForList("latelyitem");
		latelyno = sqlMapper.queryForList("latelyno");
		latelyname = sqlMapper.queryForList("latelyname");
		
		if (lately.size()>=1) {
			name1 = (String)latelyname.get(0);
			no1 = (int) latelyno.get(0);
			i1 = "/khtour/img2/" + (String)lately.get(0);}
		if (lately.size()>=2) {
			name2 = (String)latelyname.get(1);
			no2 = (int) latelyno.get(1);
			i2 = "/khtour/img2/" + (String)lately.get(1);}
		if (lately.size()>=3) {
			name3 = (String)latelyname.get(2);
			no3 = (int) latelyno.get(2);
			i3 = "/khtour/img2/" + (String)lately.get(2);}

		return SUCCESS;
	}

	
	
	public String delete() throws Exception {
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ListItem.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ListItem.sqlMapper = sqlMapper;
	}

	public List<ItemVO> getItemlist() {
		return Itemlist;
	}

	public void setItemlist(List<ItemVO> itemlist) {
		Itemlist = itemlist;
	}

	public ItemVO getIvo() {
		return ivo;
	}

	public void setIvo(ItemVO ivo) {
		this.ivo = ivo;
	}

	public List getLatelyno() {
		return latelyno;
	}

	public void setLatelyno(List latelyno) {
		this.latelyno = latelyno;
	}

	public int getNo1() {
		return no1;
	}

	public void setNo1(int no1) {
		this.no1 = no1;
	}

	public int getNo2() {
		return no2;
	}

	public void setNo2(int no2) {
		this.no2 = no2;
	}

	public int getNo3() {
		return no3;
	}

	public void setNo3(int no3) {
		this.no3 = no3;
	}

	public List getLately() {
		return lately;
	}

	public String getI1() {
		return i1;
	}

	public void setI1(String i1) {
		this.i1 = i1;
	}

	public String getI2() {
		return i2;
	}

	public void setI2(String i2) {
		this.i2 = i2;
	}

	public String getI3() {
		return i3;
	}

	public void setI3(String i3) {
		this.i3 = i3;
	}

	public void setLately(List lately) {
		this.lately = lately;
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

	public ItempagingAction getPage() {
		return page;
	}

	public void setPage(ItempagingAction page) {
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

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}

	public String[] getArea() {
		return area;
	}

	public void setArea(String[] area) {
		this.area = area;
	}

	public List getLatelyname() {
		return latelyname;
	}

	public String getName1() {
		return name1;
	}

	public void setName1(String name1) {
		this.name1 = name1;
	}

	public String getName2() {
		return name2;
	}

	public void setName2(String name2) {
		this.name2 = name2;
	}

	public String getName3() {
		return name3;
	}

	public void setName3(String name3) {
		this.name3 = name3;
	}

	public void setLatelyname(List latelyname) {
		this.latelyname = latelyname;
	}

}
