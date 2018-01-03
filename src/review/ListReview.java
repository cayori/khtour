package review;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import item.pagingActionH;

import java.io.IOException;
import java.io.Reader;

import java.util.List;
import java.util.ArrayList;

import review.ReviewVO;

public class ListReview extends ActionSupport{
		public static SqlMapClient sqlMapper;	
		public Reader reader;
		
		private ReviewVO review = new ReviewVO();
		private List<ReviewVO> reviewList = new ArrayList();
		private int currentPage = 1; //현재 페이지 지정
		private int totalCount;
		private int blockCount = 4; //한 페이지에 있는 글의 수 
		private int blockPage = 5; //페이징 수 
		private String pagingHtml;
		private PagingActionReview page;
		
		public  ListReview() throws Exception{
			reader = Resources.getResourceAsReader("sqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();	
		}
		public String execute() throws Exception {
			
			
			reviewList = sqlMapper.queryForList("selectReviewList");
			totalCount = reviewList.size();
			page = new PagingActionReview(currentPage,totalCount,blockCount,blockPage);
			
			pagingHtml = page.getPagingHtml().toString();
			int lastCount = totalCount;
			if(page.getEndCount()<totalCount)
				lastCount = page.getEndCount()+1;
			reviewList = reviewList.subList(page.getStartCount(), lastCount);
			return SUCCESS;
		}
		public ReviewVO getReview() {
			return review;
		}
		public void setReview(ReviewVO review) {
			this.review = review;
		}
		public List<ReviewVO> getReviewList() {
			return reviewList;
		}
		public void setReviewList(List<ReviewVO> reviewList) {
			this.reviewList = reviewList;
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
		public PagingActionReview getPage() {
			return page;
		}
		public void setPage(PagingActionReview page) {
			this.page = page;
		}
		
		
		
}
