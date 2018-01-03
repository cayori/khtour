package review;
import java.util.ArrayList;
import java.util.List;

import java.io.IOException;
import java.io.Reader;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
public class WriteReviewCO extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	
	private ReviewCO paramClassCO = new ReviewCO();
	private ReviewCO resultClassCO;
	
	
	private String id;
	private String pw;
	private int review_no; 
	private int no;
	private String subject;
	private String content; 
	
	public  WriteReviewCO() throws Exception{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();	
	}
	public String DeleteReviewCO() throws Exception {
		 
		paramClassCO.setNo(getNo());
		
		sqlMapper.delete("deleteReviewCO",getNo());
			 return SUCCESS;
	}
	
	
	public String execute() throws Exception {
		paramClassCO.setReview_no(getReview_no());
		paramClassCO.setId(getId());
		paramClassCO.setPw(getPw());
		paramClassCO.setContent(getContent());
		
		
		sqlMapper.insert("insertReviewCO",paramClassCO);
		return SUCCESS;
	}

	public ReviewCO getParamClassCO() {
		return paramClassCO;
	}

	public void setParamClassCO(ReviewCO paramClassCO) {
		this.paramClassCO = paramClassCO;
	}

	public ReviewCO getResultClassCO() {
		return resultClassCO;
	}

	public void setResultClassCO(ReviewCO resultClassCO) {
		this.resultClassCO = resultClassCO;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
