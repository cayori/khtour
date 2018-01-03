package service;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import service.QuestionVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;


import java.io.Reader;
import java.io.IOException;

public class WriteQuestion extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private QuestionVO paramClass;
	private QuestionVO resultClass;

	private int currentPage;

	private int question_no;
	private String id;
	private String subject;
	private String content;
	Calendar today = Calendar.getInstance();


	public WriteQuestion() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String form() throws Exception {

		return SUCCESS;
	}

	public String formModify() throws Exception {

		resultClass = new QuestionVO();

		resultClass.setQuestion_no(getQuestion_no());
		resultClass = (QuestionVO) sqlMapper.queryForObject("selectOne_question", getQuestion_no());

		return SUCCESS;
	}

	public String execute() throws Exception {

		paramClass = new QuestionVO();
		resultClass = new QuestionVO();

		ActionContext context= ActionContext.getContext();
		Map<String, String> session = context.getSession();
		
		paramClass.setId(session.get("id"));
		paramClass.setSubject(getSubject());
		paramClass.setContent(getContent());
		paramClass.setReg_date(today.getTime());

		sqlMapper.insert("insertBoard_question", paramClass);

		return SUCCESS;
	}

	public String modify() throws Exception {
		paramClass = new QuestionVO();
		resultClass = new QuestionVO();

		paramClass.setQuestion_no(getQuestion_no());
		paramClass.setSubject(getSubject());
		paramClass.setContent(getContent());

		sqlMapper.update("updateBoard_question", paramClass);
		resultClass = (QuestionVO) sqlMapper.queryForObject("selectOne_question", getQuestion_no());
		return SUCCESS;
	}

	public String delete() throws Exception {
		paramClass = new QuestionVO();
		resultClass = new QuestionVO();

		resultClass = (QuestionVO) sqlMapper.queryForObject("selectOne_question", getQuestion_no());

		paramClass.setQuestion_no(getQuestion_no());
		sqlMapper.delete("deleteBoard_Allquestionco",getQuestion_no());
		sqlMapper.delete("deleteBoard_question", paramClass);
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		WriteQuestion.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		WriteQuestion.sqlMapper = sqlMapper;
	}

	public QuestionVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(QuestionVO paramClass) {
		this.paramClass = paramClass;
	}

	public QuestionVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(QuestionVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getQuestion_no() {
		return question_no;
	}

	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
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

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
