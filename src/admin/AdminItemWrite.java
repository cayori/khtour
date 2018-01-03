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

public class AdminItemWrite extends ActionSupport {

	private static Reader reader; // 파일 스트림을 위한 reader.
	private static SqlMapClient sqlMapper; // SqlMapClient API를 사용하기 위한

	private File[] image1;
	private String[] image1FileName;
	private String fileUploadPath = "C:\\Users\\JeongEonGoo\\workspace\\khtour\\WebContent\\img2\\";
	//경로를 이클립스폴더의 img로 설정해서 업로드

	ItemVO ivo = new ItemVO();
	HotelVO hvo = new HotelVO();
	AirVO avo = new AirVO();

	File destFile;

	private String hai;
	private String name;
	private String country;
	private String region;
	private int price;
	private String content;
	private int readcount;
	private int amount;
	private int grade;
	private int cocount;
	private String air;
	private String people;
	private String room;
	private String tel;

	public AdminItemWrite() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// 지정된 리더를 사용하여 SqlMapClient를 빌드합니다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	// 상품등록
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
		
		ivo.setName(name);
		ivo.setPrice(price);
		ivo.setContent(content);
		ivo.setCountry(country);
		ivo.setRegion(region);

		ivo.setHai(hai);
		ivo.setReadcount(readcount);
		ivo.setAmount(amount);
		ivo.setGrade(grade);
		ivo.setCocount(cocount);

		if (image1 != null) {//다중업로드
			for (int i = 0; i < image1.length; i++) {
				destFile = new File(fileUploadPath + image1FileName[i]);
				FileUtils.copyFile(image1[i], destFile);
				if (i == 0) {
					ivo.setImage1((image1FileName[0]));
				}
				if (i == 1) {
					ivo.setImage2((image1FileName[1]));
				}
				if (i == 2) {
					ivo.setImage3((image1FileName[2]));
				}
			}
		}
		
		
		sqlMapper.insert("insertitem", ivo);

		return SUCCESS;
	}

	public String writeHotel() throws Exception {
		
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
		hvo.setTel(tel);

		if (image1 != null) {
			for (int i = 0; i < image1.length; i++) {
				destFile = new File(fileUploadPath + image1FileName[i]);
				FileUtils.copyFile(image1[i], destFile);
				if (i == 0) {
					hvo.setImage1((image1FileName[0]));
				}
				if (i == 1) {
					hvo.setImage2((image1FileName[1]));
				}
				if (i == 2) {
					hvo.setImage3((image1FileName[2]));
				}
			}
		}

		sqlMapper.insert("inserthotel", hvo);

		return SUCCESS;
	}

	public String writeAir() throws Exception {
		
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
			for (int i = 0; i < image1.length; i++) {
				destFile = new File(fileUploadPath + image1FileName[i]);
				FileUtils.copyFile(image1[i], destFile);
				if (i == 0) {
					avo.setImage1((image1FileName[0]));
				}
				if (i == 1) {
					avo.setImage2((image1FileName[1]));
				}
				if (i == 2) {
					avo.setImage3((image1FileName[2]));
				}
			}
		}

		sqlMapper.insert("insertair", avo);
		

		return SUCCESS;
	}

	
	public String itemwriteform() throws Exception {
		return SUCCESS;
	}

	public String airwriteform() throws Exception {
		return SUCCESS;
	}

	public String hotelwriteform() throws Exception {
		return SUCCESS;
	}

	
	
	
	
	
	
	
	public HotelVO getHvo() {
		return hvo;
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

	public void setHvo(HotelVO hvo) {
		this.hvo = hvo;
	}

	public AirVO getAvo() {
		return avo;
	}

	public void setAvo(AirVO avo) {
		this.avo = avo;
	}

	public File getDestFile() {
		return destFile;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public void setDestFile(File destFile) {
		this.destFile = destFile;
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

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		AdminItemWrite.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminItemWrite.sqlMapper = sqlMapper;
	}

	public File[] getImage1() {
		return image1;
	}

	public void setImage1(File[] image1) {
		this.image1 = image1;
	}

	public String[] getImage1FileName() {
		return image1FileName;
	}

	public void setImage1FileName(String[] image1FileName) {
		this.image1FileName = image1FileName;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public ItemVO getIvo() {
		return ivo;
	}

	public void setIvo(ItemVO ivo) {
		this.ivo = ivo;
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

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public String getAir() {
		return air;
	}

	public void setAir(String air) {
		this.air = air;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
