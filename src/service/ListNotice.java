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

public class ListNotice extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private List<NoticeVO> list = new ArrayList<NoticeVO>();

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingActionNotice page;
	
	private NoticeVO paramClass = new NoticeVO();
	private NoticeVO resultClass = new NoticeVO();

	private int notice_no;

	public ListNotice() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {

		list = sqlMapper.queryForList("selectAll_notice");

		totalCount = list.size();
		page = new pagingActionNotice(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
				
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}
	
	public String selectNotice() throws Exception {

		paramClass.setNotice_no(getNotice_no());
		sqlMapper.update("updateReadCount_notice", paramClass);

		resultClass = (NoticeVO) sqlMapper.queryForObject("selectOne_notice", getNotice_no());

		return SUCCESS;
	}
	
	
	
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ListNotice.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ListNotice.sqlMapper = sqlMapper;
	}

	public NoticeVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(NoticeVO paramClass) {
		this.paramClass = paramClass;
	}

	public NoticeVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(NoticeVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String a(){
		return SUCCESS;
	}

	public List<NoticeVO> getList() {
		return list;
	}

	public void setList(List<NoticeVO> list) {
		this.list = list;
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

	public pagingActionNotice getPage() {
		return page;
	}

	public void setPage(pagingActionNotice page) {
		this.page = page;
	}

}
