package admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import air.AirVO;
import hotel.HotelVO;
import item.ItemVO;

public class AdminItemModify extends ActionSupport {

	private Reader reader;
	private SqlMapClient sqlMapper;

	private File image1;
	private File image2;
	private File image3;
	private String image1FileName;
	private String image2FileName;
	private String image3FileName;
	private String fileUploadPath = "C:\\Users\\JeongEonGoo\\workspace\\khtour\\WebContent\\img"; 

	File destFile;

	private ItemVO ivo = new ItemVO();
	private AirVO avo = new AirVO();
	private HotelVO hvo = new HotelVO();

	private int no;
	private int readcount;
	private int amount;
	private int grade;
	private int cocount;
	private int price;

	private String hai;
	private String name;
	private String country;
	private String region;
	private String content;
	private String air;
	private String people;
	private String room;
	private String tel;

	public AdminItemModify() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {
		
		HttpServletResponse response = ServletActionContext.getResponse();
		if(name==null || price==0 || content==null || country==null || region == null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 정보를 모두 입력하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return SUCCESS;
		}
		
		ivo.setNo(no);
		ivo.setName(name);
		ivo.setPrice(price);
		ivo.setContent(content);
		ivo.setCountry(country);
		ivo.setRegion(region);
		ivo.setReadcount(readcount);
		ivo.setAmount(amount);
		ivo.setGrade(grade);
		ivo.setCocount(cocount);

		ivo.setHai(hai);
		
		//수정시 이미지를 선택적으로 업데이트
		if (image1 != null) {
			destFile = new File(fileUploadPath + image1FileName);
			FileUtils.copyFile(image1, destFile);
			ivo.setImage1((fileUploadPath + image1FileName));
		}
		if (image2 != null) {
			destFile = new File(fileUploadPath + image2FileName);
			FileUtils.copyFile(image2, destFile);
			ivo.setImage2((fileUploadPath + image2FileName));
		}
		if (image3 != null) {
			destFile = new File(fileUploadPath + image3FileName);
			FileUtils.copyFile(image3, destFile);
			ivo.setImage3((fileUploadPath + image3FileName));
		}

		sqlMapper.update("updateitem", ivo);

		no = getNo();

		return SUCCESS;

	}

	public String airmodify() throws Exception {
		
		HttpServletResponse response = ServletActionContext.getResponse();
		if(name==null || price==0 || content==null || country==null || region == null || air==null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 정보를 모두 입력하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return SUCCESS;
		}

		avo.setNo(no);
		avo.setName(name);
		avo.setPrice(price);
		avo.setContent(content);
		avo.setCountry(country);
		avo.setRegion(region);
		avo.setReadcount(readcount);
		avo.setAmount(amount);
		avo.setGrade(grade);
		avo.setCocount(cocount);

		avo.setAir(air);

		if (image1 != null) {
			destFile = new File(fileUploadPath + image1FileName);
			FileUtils.copyFile(image1, destFile);
			avo.setImage1((fileUploadPath + image1FileName));
		}
		if (image2 != null) {
			destFile = new File(fileUploadPath + image2FileName);
			FileUtils.copyFile(image2, destFile);
			avo.setImage2((fileUploadPath + image2FileName));
		}
		if (image3 != null) {
			destFile = new File(fileUploadPath + image3FileName);
			FileUtils.copyFile(image3, destFile);
			avo.setImage3((fileUploadPath + image3FileName));
		}

		sqlMapper.update("updateair", avo);
		
		no = getNo();
		
		return SUCCESS;
	}

	public String hotelmodify() throws Exception {
		
		HttpServletResponse response = ServletActionContext.getResponse();
		if(name==null || price==0 || content==null || country==null || region == null || people==null || room==null || tel == null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('상품 정보를 모두 입력하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return SUCCESS;
		}
		
		hvo.setNo(no);
		hvo.setName(name);
		hvo.setPrice(price);
		hvo.setContent(content);
		hvo.setCountry(country);
		hvo.setRegion(region);
		hvo.setReadcount(readcount);
		hvo.setAmount(amount);
		hvo.setGrade(grade);
		hvo.setCocount(cocount);

		hvo.setPeople(people);
		hvo.setRoom(room);

		if (image1 != null) {
			destFile = new File(fileUploadPath + image1FileName);
			FileUtils.copyFile(image1, destFile);
			hvo.setImage1((fileUploadPath + image1FileName));
		}
		if (image2 != null) {
			destFile = new File(fileUploadPath + image2FileName);
			FileUtils.copyFile(image2, destFile);
			hvo.setImage2((fileUploadPath + image2FileName));
		}
		if (image3 != null) {
			destFile = new File(fileUploadPath + image3FileName);
			FileUtils.copyFile(image3, destFile);
			hvo.setImage3((fileUploadPath + image3FileName));
		}

		sqlMapper.update("updatehotel", hvo);

		no = getNo();

		return SUCCESS;
	}

	public String itemform() throws Exception {
		ivo.setNo(no);
		ivo = (ItemVO) sqlMapper.queryForObject("modifyitem", ivo);
		return SUCCESS;
	}

	public String airform() throws Exception {
		avo.setNo(no);
		avo = (AirVO) sqlMapper.queryForObject("modifyair", avo);
		return SUCCESS;
	}

	public String hotelform() throws Exception {
		hvo.setNo(no);
		hvo = (HotelVO) sqlMapper.queryForObject("modifyhotel", hvo);
		return SUCCESS;
	}

	public Reader getReader() {
		return reader;
	}

	public void setReader(Reader reader) {
		this.reader = reader;
	}

	public SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public void setSqlMapper(SqlMapClient sqlMapper) {
		this.sqlMapper = sqlMapper;
	}

	public File getImage1() {
		return image1;
	}

	public void setImage1(File image1) {
		this.image1 = image1;
	}

	public File getImage2() {
		return image2;
	}

	public void setImage2(File image2) {
		this.image2 = image2;
	}

	public File getImage3() {
		return image3;
	}

	public void setImage3(File image3) {
		this.image3 = image3;
	}

	public String getImage1FileName() {
		return image1FileName;
	}

	public void setImage1FileName(String image1FileName) {
		this.image1FileName = image1FileName;
	}

	public String getImage2FileName() {
		return image2FileName;
	}

	public void setImage2FileName(String image2FileName) {
		this.image2FileName = image2FileName;
	}

	public String getImage3FileName() {
		return image3FileName;
	}

	public void setImage3FileName(String image3FileName) {
		this.image3FileName = image3FileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public File getDestFile() {
		return destFile;
	}

	public void setDestFile(File destFile) {
		this.destFile = destFile;
	}

	public ItemVO getIvo() {
		return ivo;
	}

	public void setIvo(ItemVO ivo) {
		this.ivo = ivo;
	}

	public AirVO getAvo() {
		return avo;
	}

	public void setAvo(AirVO avo) {
		this.avo = avo;
	}

	public HotelVO getHvo() {
		return hvo;
	}

	public void setHvo(HotelVO hvo) {
		this.hvo = hvo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getCocount() {
		return cocount;
	}

	public void setCocount(int cocount) {
		this.cocount = cocount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getHai() {
		return hai;
	}

	public void setHai(String hai) {
		this.hai = hai;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAir() {
		return air;
	}

	public void setAir(String air) {
		this.air = air;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}
