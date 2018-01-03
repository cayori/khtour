package item;

import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import air.AirVO;
import hotel.HotelVO;
import service.QuestionVO;

public class SelectOne extends ActionSupport {

	public static SqlMapClient sqlMapper;
	public Reader reader;
	private int no;
	private int c_no;
	private HotelVO hotel = new HotelVO();
	private ItemVO item = new ItemVO();
	private AirVO avo = new AirVO();
	
	private String se;

	private List<ContentCO> contentCO = new ArrayList<ContentCO>();
	private List<ContentCOA> contentCOA = new ArrayList<ContentCOA>();
	private List<ContentCOI> contentCOI = new ArrayList<ContentCOI>();
	private List<QuestionVO> itemQ = new ArrayList<QuestionVO>();

	private int currentPage = 1; // 현재 페이지 지정
	private int totalCount;
	private int totalCountQ;
	private int blockCount = 4; // 한 페이지에 있는 글의 수
	private int blockPage = 5; // 페이징 수
	private String pagingHtml;
	private String pagingHtmlQ;
	private pagingActionH page;
	private pagingActionHQ pageQ;
	private pagingActionA pageA;
	private pagingActionAQ pageAQ;
	private pagingActionI pageI;
	private pagingActionIQ pageIQ;
	

	public SelectOne() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {// 호텔상세보기 불러오기
	
		hotel = (HotelVO) sqlMapper.queryForObject("selectNoH", getNo());
		contentCO = sqlMapper.queryForList("selectOneCC", getNo());
		itemQ = sqlMapper.queryForList("selectAllQuestion");
		
		totalCount = contentCO.size();
		totalCountQ = itemQ.size();
		
		page = new pagingActionH(currentPage, totalCount, blockCount, blockPage, getNo());
		pageQ = new pagingActionHQ(currentPage, totalCountQ, blockCount, blockPage, getNo());
		
		pagingHtml = page.getPagingHtml().toString();
		pagingHtmlQ = pageQ.getPagingHtml().toString();
		
		int lastCount = totalCount;
		int lastCountQ = totalCountQ;
		
		if(pageQ.getEndCount()<totalCountQ)
			lastCountQ = pageQ.getEndCount() + 1;
		itemQ = itemQ.subList(pageQ.getStartCount(), lastCountQ);
		
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		contentCO = contentCO.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}

	public String executeI() throws Exception {// 여행상품상세보기
		item = (ItemVO) sqlMapper.queryForObject("selectNoI", getNo());
		contentCOI = sqlMapper.queryForList("selectOneCCI", getNo());
		itemQ = sqlMapper.queryForList("selectAllQuestion");
		totalCount = contentCOI.size();
		totalCountQ = itemQ.size();
		pageI = new pagingActionI(currentPage, totalCount, blockCount, blockPage, getNo());
		pageIQ = new pagingActionIQ(currentPage, totalCountQ, blockCount, blockPage, getNo());
		pagingHtml = pageI.getPagingHtml().toString();
		pagingHtmlQ = pageIQ.getPagingHtml().toString();
		int lastCount = totalCount;
		int lastCountQ = totalCountQ;
		if(pageIQ.getEndCount()<totalCountQ)
			lastCountQ = pageIQ.getEndCount() + 1;
		itemQ = itemQ.subList(pageIQ.getStartCount(), lastCountQ);
		if (pageI.getEndCount() < totalCount)
			lastCount = pageI.getEndCount() + 1;
		contentCOI = contentCOI.subList(pageI.getStartCount(), lastCount);

		return SUCCESS;
	}

	public String executeA() throws Exception {// 항공권상세보기

		avo = (AirVO) sqlMapper.queryForObject("selectNoA", getNo());
		contentCOA = sqlMapper.queryForList("selectOneCCA", getNo());
		itemQ = sqlMapper.queryForList("selectAllQuestion");
		
		totalCount = contentCOA.size();
		totalCountQ = itemQ.size();
		
		pageA = new pagingActionA(currentPage, totalCount, blockCount, blockPage, getNo());
		pageAQ = new pagingActionAQ(currentPage, totalCountQ, blockCount, blockPage, getNo());
		

		pagingHtml = pageA.getPagingHtml().toString();
		pagingHtmlQ = pageAQ.getPagingHtml().toString();
		
		int lastCount = totalCount;
		int lastCountQ = totalCountQ;
		
		if(pageAQ.getEndCount()<totalCountQ)
			lastCountQ = pageAQ.getEndCount() + 1;
		itemQ = itemQ.subList(pageAQ.getStartCount(), lastCountQ);
		
		
		if (pageA.getEndCount() < totalCount)
			lastCount = pageA.getEndCount() + 1;
		contentCOA = contentCOA.subList(pageA.getStartCount(), lastCount);
		
		return SUCCESS;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public HotelVO getHotel() {
		return hotel;
	}

	public void setHotel(HotelVO hotel) {
		this.hotel = hotel;
	}

	public ItemVO getItem() {
		return item;
	}

	public void setItem(ItemVO item) {
		this.item = item;
	}

	public AirVO getAvo() {
		return avo;
	}

	public void setAvo(AirVO avo) {
		this.avo = avo;
	}

	public List<ContentCO> getContentCO() {
		return contentCO;
	}

	public void setContentCO(List<ContentCO> contentCO) {
		this.contentCO = contentCO;
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

	public pagingActionH getPage() {
		return page;
	}

	public void setPage(pagingActionH page) {
		this.page = page;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public List<ContentCOA> getContentCOA() {
		return contentCOA;
	}

	public void setContentCOA(List<ContentCOA> contentCOA) {
		this.contentCOA = contentCOA;
	}

	public List<ContentCOI> getContentCOI() {
		return contentCOI;
	}

	public void setContentCOI(List<ContentCOI> contentCOI) {
		this.contentCOI = contentCOI;
	}

	public List<QuestionVO> getItemQ() {
		return itemQ;
	}

	public void setItemQ(List<QuestionVO> itemQ) {
		this.itemQ = itemQ;
	}

	public pagingActionA getPageA() {
		return pageA;
	}

	public void setPageA(pagingActionA pageA) {
		this.pageA = pageA;
	}

	public pagingActionI getPageI() {
		return pageI;
	}

	public void setPageI(pagingActionI pageI) {
		this.pageI = pageI;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		SelectOne.sqlMapper = sqlMapper;
	}

	public Reader getReader() {
		return reader;
	}

	public void setReader(Reader reader) {
		this.reader = reader;
	}

	public int getTotalCountQ() {
		return totalCountQ;
	}

	public void setTotalCountQ(int totalCountQ) {
		this.totalCountQ = totalCountQ;
	}

	public String getPagingHtmlQ() {
		return pagingHtmlQ;
	}

	public void setPagingHtmlQ(String pagingHtmlQ) {
		this.pagingHtmlQ = pagingHtmlQ;
	}

	public pagingActionHQ getPageQ() {
		return pageQ;
	}

	public void setPageQ(pagingActionHQ pageQ) {
		this.pageQ = pageQ;
	}

	public pagingActionAQ getPageAQ() {
		return pageAQ;
	}

	public void setPageAQ(pagingActionAQ pageAQ) {
		this.pageAQ = pageAQ;
	}

	public pagingActionIQ getPageIQ() {
		return pageIQ;
	}

	public void setPageIQ(pagingActionIQ pageIQ) {
		this.pageIQ = pageIQ;
	}

	public String getSe() {
		return se;
	}

	public void setSe(String se) {
		this.se = se;
	}

}
