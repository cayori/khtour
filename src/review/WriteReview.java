package review;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import java.io.IOException;
import java.io.Reader;

import org.apache.commons.io.FileUtils;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class WriteReview extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private ReviewVO paramClass = new ReviewVO();
	private ReviewVO resultClass = new ReviewVO();
	private String id;
	private String pw;
	private int review_no;
	private int no;
	private String subject;
	private String content;
	private String image1;
	private String image2;
	private String image3;
	private int readcount;
	private File[] upload;
	private String[] uploadContentType;
	private String[] uploadFileName;
	private String fileUploadPath = "C:\\Users\\JeongEonGoo\\workspace\\khtour\\WebContent\\img\\";
	public WriteReview() throws Exception {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		
		if (getUpload() != null) {
			for (int i = 0; i < getUpload().length; i++) {
				File destFile = new File(fileUploadPath + getUploadFileName()[i]);

				FileUtils.copyFile(getUpload()[i], destFile);
				if (i == 0) {
					uploadFileName[0] = "/khtour/img/"+getUploadFileName()[0];
					paramClass.setImage1(uploadFileName[0]);
				} else if (i == 1) {
					uploadFileName[1] = "/khtour/img/"+getUploadFileName()[1];
					paramClass.setImage2(uploadFileName[1]);
				} else {
					uploadFileName[2] = "/khtour/img/"+getUploadFileName()[2];
					paramClass.setImage3(uploadFileName[2]);
				}
			}
		}
		paramClass.setReadcount(getReadcount());
		paramClass.setId(getId());
		paramClass.setPw(getPw());
		paramClass.setContent(getContent());
		paramClass.setSubject(getSubject());
		sqlMapper.insert("insertReview", paramClass);

		return SUCCESS;
	}

	public String reviewModify() throws Exception {

		if (getUpload() != null) {
			for (int i = 0; i < getUpload().length; i++) {
				File destFile = new File(fileUploadPath + getUploadFileName()[i]);

				FileUtils.copyFile(getUpload()[i], destFile);
				if (i == 0) {
					paramClass.setImage1(getUploadFileName()[i]);
				} else if (i == 1) {
					paramClass.setImage2(getUploadFileName()[1]);
				} else {
					paramClass.setImage3(getUploadFileName()[2]);
				}
			}
		}
		paramClass.setReview_no(getReview_no());
		paramClass.setPw(getPw());
		paramClass.setContent(getContent());
		paramClass.setSubject(getSubject());
		sqlMapper.update("updateReview", paramClass);

		resultClass = (ReviewVO) sqlMapper.queryForObject("selectReviewOne", getReview_no());

		return SUCCESS;
	}

	public String reviewModifyForm() throws Exception {
		paramClass.setReview_no(getReview_no());
		paramClass = (ReviewVO) sqlMapper.queryForObject("selectReviewOne", getReview_no());
		return SUCCESS;
	}

	public String delete() throws Exception {
		sqlMapper.delete("deleteAllReviewCO",getReview_no());
		sqlMapper.delete("deleteReview", getReview_no());

		return SUCCESS;
	}

	public String reviewWriteForm() throws Exception {

		return SUCCESS;
	}

	public ReviewVO getParamClass() {
		return paramClass;
	}

	public ReviewVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(ReviewVO resultClass) {
		this.resultClass = resultClass;
	}

	public void setParamClass(ReviewVO paramClass) {
		this.paramClass = paramClass;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
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

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public File[] getUpload() {
		return upload;
	}

	public void setUpload(File[] upload) {
		this.upload = upload;
	}

	public String[] getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String[] getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String[] uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
}
