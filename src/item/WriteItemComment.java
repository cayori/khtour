package item;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class WriteItemComment extends ActionSupport {
	public static SqlMapClient sqlMapper;
	public Reader reader;
	
	private int no;
	private int seq_no;
	private String c_id;
	private String c_content;
	private int c_no;
	private int c_grade;
	ContentCO contentCO = new ContentCO();
	ContentCOA contentCOA = new ContentCOA();
	ContentCOI contentCOI = new ContentCOI();

	public WriteItemComment() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}

	public String execute() throws Exception { // 호텔 코멘트 쓰기

		contentCO.setSeq_no(getNo());
		contentCO.setC_content(getC_content());
		contentCO.setC_id(getC_id());
		contentCO.setC_grade(getC_grade());
		sqlMapper.insert("insertCommentH", contentCO);
		sqlMapper.update("updateGrade_hotel", contentCO);

		return SUCCESS;
	}

	public String executeI() throws Exception { // 아이템 코멘트 쓰기

		contentCOI.setSeq_no(getNo());
		contentCOI.setC_content(getC_content());
		contentCOI.setC_id(getC_id());
		contentCOI.setC_grade(getC_grade());
		sqlMapper.insert("insertCommentI", contentCOI);
		sqlMapper.update("updateGrade_item", contentCOI);
		return SUCCESS;
	}

	public String executeA() throws Exception { // 항공 코멘트 쓰기

		contentCOA.setSeq_no(getNo());
		contentCOA.setC_content(getC_content());
		contentCOA.setC_id(getC_id());
		contentCOA.setC_grade(getC_grade());
		sqlMapper.insert("insertCommentA", contentCOA);
		sqlMapper.update("updateGrade_air", contentCOA);
		return SUCCESS;
	}

	public String deleteH() throws Exception { // 호텔 코멘트 삭제
		sqlMapper.delete("deleteOneCH", getC_no());

		return SUCCESS;
	}

	public String deleteA() throws Exception { // 호텔 코멘트 삭제
		sqlMapper.delete("deleteOneCA", getC_no());

		return SUCCESS;
	}

	public String deleteI() throws Exception { // 호텔 코멘트 삭제
		sqlMapper.delete("deleteOneCI", getC_no());

		return SUCCESS;
	}

	public int getC_grade() {
		return c_grade;
	}

	public void setC_grade(int c_grade) {
		this.c_grade = c_grade;
	}

	public int getSeq_no() {
		return seq_no;
	}

	public void setSeq_no(int seq_no) {
		this.seq_no = seq_no;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public ContentCO getContentCO() {
		return contentCO;
	}

	public void setContentCO(ContentCO contentCO) {
		this.contentCO = contentCO;
	}

	public int getC_no() {
		return c_no;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		WriteItemComment.sqlMapper = sqlMapper;
	}

	public Reader getReader() {
		return reader;
	}

	public void setReader(Reader reader) {
		this.reader = reader;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public ContentCOA getContentCOA() {
		return contentCOA;
	}

	public void setContentCOA(ContentCOA contentCOA) {
		this.contentCOA = contentCOA;
	}

	public ContentCOI getContentCOI() {
		return contentCOI;
	}

	public void setContentCOI(ContentCOI contentCOI) {
		this.contentCOI = contentCOI;
	}

}
