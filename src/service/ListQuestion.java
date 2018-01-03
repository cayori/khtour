package service;

import com.opensymphony.xwork2.ActionSupport;

import admin.QuestionCO;
import service.QuestionVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import service.pagingActionQuestion;
import service.pagingActionQuestionCo;;

public class ListQuestion extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private List<QuestionVO> list = new ArrayList<QuestionVO>();
	private List<QuestionCO> listco = new ArrayList<QuestionCO>();

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	
	private int currentPageCo = 1;
	private int totalCountCo;
	private int blockCountCo = 10;
	private int blockPageCo = 5;
	
	private String pagingHtml;
	private pagingActionQuestion page;

	private String pagingHtmlco;
	private pagingActionQuestionCo pageco;

	private QuestionVO paramClass = new QuestionVO();
	private QuestionVO resultClass = new QuestionVO();

	private QuestionCO paramClassCo = new QuestionCO();
	private QuestionCO resultClassCo = new QuestionCO();

	private int question_no;
	

	public ListQuestion() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {

		list = sqlMapper.queryForList("selectAll_question");

		totalCount = list.size();
		page = new pagingActionQuestion(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}

	public String selectQuestion() throws Exception {
		
		paramClass.setQuestion_no(getQuestion_no());
		sqlMapper.update("updateReadCount_question", paramClass);

		resultClass = (QuestionVO) sqlMapper.queryForObject("selectOne_question", getQuestion_no());

		listco = sqlMapper.queryForList("selectAll2_questionco", getQuestion_no());

		totalCountCo = listco.size();
		int cupage= getCurrentPage();
		int quno= getQuestion_no();
		pageco = new pagingActionQuestionCo(currentPageCo, totalCountCo, blockCountCo, blockPageCo, cupage, quno);
		pagingHtmlco = pageco.getPagingHtmlCo().toString();
		
		int lastCountCo= totalCountCo;
		
		if(pageco.getEndCountCo()<totalCountCo)
			lastCountCo= pageco.getEndCountCo()+1;
		
		listco= listco.subList(pageco.getStartCountCo(), lastCountCo);

		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ListQuestion.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ListQuestion.sqlMapper = sqlMapper;
	}

	public List<QuestionVO> getList() {
		return list;
	}

	public void setList(List<QuestionVO> list) {
		this.list = list;
	}

	public List<QuestionCO> getListco() {
		return listco;
	}

	public void setListco(List<QuestionCO> listco) {
		this.listco = listco;
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

	public int getCurrentPageCo() {
		return currentPageCo;
	}

	public void setCurrentPageCo(int currentPageCo) {
		this.currentPageCo = currentPageCo;
	}

	public int getTotalCountCo() {
		return totalCountCo;
	}

	public void setTotalCountCo(int totalCountCo) {
		this.totalCountCo = totalCountCo;
	}

	public int getBlockCountCo() {
		return blockCountCo;
	}

	public void setBlockCountCo(int blockCountCo) {
		this.blockCountCo = blockCountCo;
	}

	public int getBlockPageCo() {
		return blockPageCo;
	}

	public void setBlockPageCo(int blockPageCo) {
		this.blockPageCo = blockPageCo;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public pagingActionQuestion getPage() {
		return page;
	}

	public void setPage(pagingActionQuestion page) {
		this.page = page;
	}

	public String getPagingHtmlco() {
		return pagingHtmlco;
	}

	public void setPagingHtmlco(String pagingHtmlco) {
		this.pagingHtmlco = pagingHtmlco;
	}

	public pagingActionQuestionCo getPageco() {
		return pageco;
	}

	public void setPageco(pagingActionQuestionCo pageco) {
		this.pageco = pageco;
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

	public QuestionCO getParamClassCo() {
		return paramClassCo;
	}

	public void setParamClassCo(QuestionCO paramClassCo) {
		this.paramClassCo = paramClassCo;
	}

	public QuestionCO getResultClassCo() {
		return resultClassCo;
	}

	public void setResultClassCo(QuestionCO resultClassCo) {
		this.resultClassCo = resultClassCo;
	}

	public int getQuestion_no() {
		return question_no;
	}

	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}
	
}