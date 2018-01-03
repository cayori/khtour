package admin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import service.QuestionVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;


import java.io.Reader;
import java.io.IOException;

public class AdminReply extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private QuestionCO paramClass;
	private QuestionCO resultClass;
	private QuestionVO qvo;

	private int currentPage;

	private int question_no;
	private int no;
	private String id;
	private String content;
	/*더넣을게있나??????????????????*/
	Calendar today = Calendar.getInstance();
	
	public AdminReply() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {

		paramClass = new QuestionCO();
		resultClass = new QuestionCO();
		
		

		ActionContext context= ActionContext.getContext();
		Map<String, String> session = context.getSession();
		
		paramClass.setId(session.get("id"));
		paramClass.setQuestion_no(getQuestion_no());
		paramClass.setContent(getContent());
		paramClass.setReg_date(today.getTime());

		sqlMapper.insert("insertBoard_questionco", paramClass);

		sqlMapper.update("updateCocount_questionco", getQuestion_no());
		

		return SUCCESS;
	}
	
	public String delete() throws Exception {
		paramClass = new QuestionCO();
		resultClass = new QuestionCO();

		resultClass = (QuestionCO) sqlMapper.queryForObject("selectOne_questionco", getNo());

		paramClass.setNo(getNo());

		sqlMapper.update("deleteBoard_questionco", paramClass);

		sqlMapper.update("updateCocountDown_questionco", getQuestion_no());
		return SUCCESS;
	}

	
	
	public QuestionVO getQvo() {
		return qvo;
	}

	public void setQvo(QuestionVO qvo) {
		this.qvo = qvo;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		AdminReply.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminReply.sqlMapper = sqlMapper;
	}

	public QuestionCO getParamClass() {
		return paramClass;
	}

	public void setParamClass(QuestionCO paramClass) {
		this.paramClass = paramClass;
	}

	public QuestionCO getResultClass() {
		return resultClass;
	}

	public void setResultClass(QuestionCO resultClass) {
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

}
