package admin;

import com.opensymphony.xwork2.ActionSupport;

import service.NoticeVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;


import java.io.Reader;
import java.io.IOException;

public class AdminWriteNotice extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private NoticeVO paramClass;
	private NoticeVO resultClass;

	private int currentPage;

	private int notice_no;
	private String subject;
	private String content;
	Calendar today = Calendar.getInstance();

	public AdminWriteNotice() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String form() throws Exception {
		return SUCCESS;
	}

	public String formModify() throws Exception {
		
		resultClass = new NoticeVO();

		resultClass.setNotice_no(getNotice_no());
		resultClass = (NoticeVO) sqlMapper.queryForObject("selectOne_notice", getNotice_no());
		
		return SUCCESS;
	}

	public String execute() throws Exception {

		paramClass = new NoticeVO();
		resultClass = new NoticeVO();
		
		paramClass.setSubject(getSubject());
		paramClass.setContent(getContent());
		paramClass.setReg_date(today.getTime());

		sqlMapper.insert("insertBoard_notice", paramClass);

		return SUCCESS;
	}

	public String modify() throws Exception {
		paramClass = new NoticeVO();
		resultClass = new NoticeVO();

		paramClass.setNotice_no(getNotice_no());
		paramClass.setSubject(getSubject());
		paramClass.setContent(getContent());
		
		sqlMapper.update("updateBoard_notice", paramClass);
		resultClass = (NoticeVO) sqlMapper.queryForObject("selectOne_notice", getNotice_no());
		return SUCCESS;
	}
	
	public String delete() throws Exception{
		paramClass = new NoticeVO();
		resultClass = new NoticeVO();
		
		resultClass = (NoticeVO) sqlMapper.queryForObject("selectOne_notice", getNotice_no());
		
		paramClass.setNotice_no(getNotice_no());

		sqlMapper.update("deleteBoard_notice", paramClass);
		return SUCCESS;
	}



	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public NoticeVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(NoticeVO paramClass) {
		this.paramClass = paramClass;
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

	public NoticeVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(NoticeVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

}
