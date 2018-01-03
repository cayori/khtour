package review;

import java.util.List;
import java.util.ArrayList;
import java.io.Reader;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
public class SelectReview extends ActionSupport{

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<ReviewCO> paramClassCO = new ArrayList<ReviewCO>();
	private ReviewVO paramClass = new ReviewVO();
	private ReviewVO resultClass = new ReviewVO();
	private int review_no;
	
	private int currentPage = 1; //현재 페이지 지정
	private int totalCount;
	private int blockCount = 4; //한 페이지에 있는 글의 수 
	private int blockPage = 5; //페이징 수 
	private String pagingHtml;
	private pagingActionRC page;
	
	public SelectReview() throws Exception{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();	
		
	}
	
	
	
	
	
	
	public String execute() throws Exception {
		 
		paramClassCO = sqlMapper.queryForList("selectReviewCOList", getReview_no());
		sqlMapper.update("updatereadcount",getReview_no());
		resultClass = (ReviewVO)sqlMapper.queryForObject("selectReviewOne",getReview_no());
		
		totalCount = paramClassCO.size();	
		page = new pagingActionRC(currentPage,totalCount,blockCount,blockPage,getReview_no());
		
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;
		if(page.getEndCount()<totalCount)
			lastCount = page.getEndCount()+1;
		paramClassCO = paramClassCO.subList(page.getStartCount(), lastCount);
		
		
		
		
		
		
		return SUCCESS;
	}

	public ReviewVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(ReviewVO paramClass) {
		this.paramClass = paramClass;
	}

	public ReviewVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(ReviewVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}


	public List<ReviewCO> getParamClassCO() {
		return paramClassCO;
	}


	public void setParamClassCO(List<ReviewCO> paramClassCO) {
		this.paramClassCO = paramClassCO;
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






	public pagingActionRC getPage() {
		return page;
	}






	public void setPage(pagingActionRC page) {
		this.page = page;
	}






	


	
	
	
}
