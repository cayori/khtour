package order;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import order.pagingActionO;
import order.OrderVO;


public class OrderList  extends ActionSupport{
	public static SqlMapClient sqlMapper;	
	public Reader reader;
	
	private int currentPage = 1; //현재 페이지 지정
	private int totalCount;
	private int blockCount = 4; //한 페이지에 있는 글의 수 
	private int blockPage = 5; //페이징 수 
	private String pagingHtml;
	private pagingActionO page;
	
	private OrderVO ord = new OrderVO();
	//orderList 페이징
	
	
	private List<OrderVO> order = new ArrayList<OrderVO>();
	private String id;//세션 아이디값 받기
	private int[] deleteCheck;//체크한시컨스번호
	public OrderList() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();	

	}


	public String execute() throws Exception { //구매내역 리스트뽑기
		
		order = sqlMapper.queryForList("selectorder",getId());
		
		totalCount = order.size();
		page = new pagingActionO(currentPage,totalCount,blockCount,blockPage,getId());
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if(page.getEndCount()<totalCount)
			lastCount = page.getEndCount()+1;
		order = order.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}

public String deleteOrder() throws Exception {//구매내역삭제
			ord.setId(getId());
				for(int i=0;i<deleteCheck.length;i++){
			         ord.setSeq_no(deleteCheck[i]);	
			         
			sqlMapper.delete("deleteorder", ord);	
			
			
			}
			
			
		return SUCCESS;
	}
	public List<OrderVO> getOrder() {
		return order;
	}


	public void setOrder(List<OrderVO> order) {
		this.order = order;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
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


	public pagingActionO getPage() {
		return page;
	}


	public void setPage(pagingActionO page) {
		this.page = page;
	}


	public int[] getDeleteCheck() {
		return deleteCheck;
	}


	public void setDeleteCheck(int[] deleteCheck) {
		this.deleteCheck = deleteCheck;
	}


	public OrderVO getOrd() {
		return ord;
	}


	public void setOrd(OrderVO ord) {
		this.ord = ord;
	}
	
	
	
	
}
