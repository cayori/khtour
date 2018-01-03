package hotel;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class ListHotel extends ActionSupport {
	public static Reader reader; 
	public static SqlMapClient sqlMapper; 
										

	private List<HotelVO> Hotellist = new ArrayList<HotelVO>();
	private HotelVO hvo = new HotelVO();

	private int currentPage = 1; 
	private int totalCount;
	private int blockCount = 5; 
	private int blockPage = 5; 
	private String pagingHtml; 
	private HotelpagingAction page; // 
	private String search;
	private String n;  
	private String[] kind = {"", "서울", "부산", "제주", "광주", "강원", "경주"};
	
	
	private String pn;
	private String rn;
	
	private String[] people = {"0", "1","2","3","4","5","6","7","8","9","10"};
	private String[] room = {"0", "1","2","3","4","5","6","7","8","9","10"};

	public ListHotel() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
	
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		if (search == null) { search = ""; }
		if (n == null) {n = "0"; }
		if (pn == null || pn.equals("")) { pn = "0"; }
		if (rn == null || rn.equals("")) { rn = "0"; }
		
		if (search.equals("") && rn.equals("0")) {//전체 목록 및 지역별 정렬
			hvo.setSearch(getSearch());
			hvo.setSearchn(kind[Integer.parseInt(n)]);
			Hotellist = sqlMapper.queryForList("listhotel", hvo);
		} else if(!search.equals("") && !n.equals("0")){//지역별 정렬 후 검색
			hvo.setSearch(getSearch());
			hvo.setSearchn(kind[Integer.parseInt(n)]);
			hvo.setPeople(people[Integer.parseInt(pn)]);
			hvo.setRoom(room[Integer.parseInt(rn)]);
			Hotellist = sqlMapper.queryForList("searchhotel", hvo);
		} else if(!search.equals("") || !rn.equals("0")){//검색값이 있거나 객실 값이 있을 때 검색
			hvo.setSearch(getSearch());
			hvo.setPeople(people[Integer.parseInt(pn)]);
			hvo.setRoom(room[Integer.parseInt(rn)]);
			Hotellist = sqlMapper.queryForList("searchroom", hvo);
		}
		

		totalCount = Hotellist.size();

		if (currentPage == 0) {
			currentPage = 1;
		}
		page = new HotelpagingAction(currentPage, totalCount, blockCount, blockPage, search, n);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		Hotellist = Hotellist.subList(page.getStartCount(), lastCount);
		
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ListHotel.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ListHotel.sqlMapper = sqlMapper;
	}

	public List<HotelVO> getHotellist() {
		return Hotellist;
	}

	public void setHotellist(List<HotelVO> hotellist) {
		Hotellist = hotellist;
	}

	public HotelVO getHvo() {
		return hvo;
	}

	public void setHvo(HotelVO hvo) {
		this.hvo = hvo;
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

	public HotelpagingAction getPage() {
		return page;
	}

	public void setPage(HotelpagingAction page) {
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

	public String getPn() {
		return pn;
	}

	public void setPn(String pn) {
		this.pn = pn;
	}

	public String getRn() {
		return rn;
	}

	public void setRn(String rn) {
		this.rn = rn;
	}

	public String[] getPeople() {
		return people;
	}

	public void setPeople(String[] people) {
		this.people = people;
	}

	public String[] getRoom() {
		return room;
	}

	public void setRoom(String[] room) {
		this.room = room;
	}
	
}