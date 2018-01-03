package service;
import com.opensymphony.xwork2.ActionSupport;

import service.NoticeVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import service.pagingActionNotice;

public class ServiceForm extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private List<NoticeVO> noticelist = new ArrayList<NoticeVO>();
	private List<QuestionVO> questionlist= new ArrayList<QuestionVO>();
	
	private int ncurrentPage = 1;
	private int ntotalCount;
	private int nblockCount = 3;
	private int nblockPage = 5;
	private String npagingHtml;
	private pagingActionNotice npage;
	
	private int qcurrentPage = 1;
	private int qtotalCount;
	private int qblockCount = 3;
	private int qblockPage = 5;
	private String qpagingHtml;
	private pagingActionQuestion qpage;
	
	private NoticeVO nparamClass = new NoticeVO();
	private NoticeVO nresultClass = new NoticeVO();
	
	private QuestionVO qparamClass = new QuestionVO();
	private QuestionVO qresultClass = new QuestionVO();
	
	private int notice_no;

	public ServiceForm() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		
		noticelist = sqlMapper.queryForList("selectAll_notice");

		npage = new pagingActionNotice(ncurrentPage, ntotalCount, nblockCount, nblockPage);
		npagingHtml = npage.getPagingHtml().toString();
				
		ntotalCount = noticelist.size();
		
		int nlastCount = ntotalCount;

		if (npage.getEndCount() < ntotalCount)
			nlastCount = npage.getEndCount() + 1;

		noticelist = noticelist.subList(npage.getStartCount(), nlastCount);

		/*±¸ºÐ¼±========================*/
		
		questionlist = sqlMapper.queryForList("selectAll_question");

		qpage = new pagingActionQuestion(qcurrentPage, qtotalCount, qblockCount, qblockPage);
		qpagingHtml = qpage.getPagingHtml().toString();
		
		qtotalCount = questionlist.size();
				
		int qlastCount = qtotalCount;

		if (qpage.getEndCount() < qtotalCount)
			qlastCount = qpage.getEndCount() + 1;

		questionlist = questionlist.subList(qpage.getStartCount(), qlastCount);
		
		return SUCCESS;
		
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ServiceForm.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ServiceForm.sqlMapper = sqlMapper;
	}

	public List<NoticeVO> getNoticelist() {
		return noticelist;
	}

	public void setNoticelist(List<NoticeVO> noticelist) {
		this.noticelist = noticelist;
	}

	public List<QuestionVO> getQuestionlist() {
		return questionlist;
	}

	public void setQuestionlist(List<QuestionVO> questionlist) {
		this.questionlist = questionlist;
	}

	public int getNcurrentPage() {
		return ncurrentPage;
	}

	public void setNcurrentPage(int ncurrentPage) {
		this.ncurrentPage = ncurrentPage;
	}

	public int getNtotalCount() {
		return ntotalCount;
	}

	public void setNtotalCount(int ntotalCount) {
		this.ntotalCount = ntotalCount;
	}

	public int getNblockCount() {
		return nblockCount;
	}

	public void setNblockCount(int nblockCount) {
		this.nblockCount = nblockCount;
	}

	public int getNblockPage() {
		return nblockPage;
	}

	public void setNblockPage(int nblockPage) {
		this.nblockPage = nblockPage;
	}

	public String getNpagingHtml() {
		return npagingHtml;
	}

	public void setNpagingHtml(String npagingHtml) {
		this.npagingHtml = npagingHtml;
	}

	public pagingActionNotice getNpage() {
		return npage;
	}

	public void setNpage(pagingActionNotice npage) {
		this.npage = npage;
	}

	public int getQcurrentPage() {
		return qcurrentPage;
	}

	public void setQcurrentPage(int qcurrentPage) {
		this.qcurrentPage = qcurrentPage;
	}

	public int getQtotalCount() {
		return qtotalCount;
	}

	public void setQtotalCount(int qtotalCount) {
		this.qtotalCount = qtotalCount;
	}

	public int getQblockCount() {
		return qblockCount;
	}

	public void setQblockCount(int qblockCount) {
		this.qblockCount = qblockCount;
	}

	public int getQblockPage() {
		return qblockPage;
	}

	public void setQblockPage(int qblockPage) {
		this.qblockPage = qblockPage;
	}

	public String getQpagingHtml() {
		return qpagingHtml;
	}

	public void setQpagingHtml(String qpagingHtml) {
		this.qpagingHtml = qpagingHtml;
	}

	public pagingActionQuestion getQpage() {
		return qpage;
	}

	public void setQpage(pagingActionQuestion qpage) {
		this.qpage = qpage;
	}

	public NoticeVO getNparamClass() {
		return nparamClass;
	}

	public void setNparamClass(NoticeVO nparamClass) {
		this.nparamClass = nparamClass;
	}

	public NoticeVO getNresultClass() {
		return nresultClass;
	}

	public void setNresultClass(NoticeVO nresultClass) {
		this.nresultClass = nresultClass;
	}

	public QuestionVO getQparamClass() {
		return qparamClass;
	}

	public void setQparamClass(QuestionVO qparamClass) {
		this.qparamClass = qparamClass;
	}

	public QuestionVO getQresultClass() {
		return qresultClass;
	}

	public void setQresultClass(QuestionVO qresultClass) {
		this.qresultClass = qresultClass;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}


}