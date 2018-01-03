package admin;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import air.AirVO;
import hotel.HotelVO;
import item.ItemVO;

public class AdminItemDelete extends ActionSupport{
	
	private static Reader reader;
	private static SqlMapClient sqlMapper;
	
	private int no;
	
	ItemVO ivo = new ItemVO();
	HotelVO hvo = new HotelVO();
	AirVO avo = new AirVO();
	
	public AdminItemDelete() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	//���� ��ǰ ����
	public String execute() throws Exception{
		ivo.setNo(no);
		
		sqlMapper.delete("deletecoi", ivo);//�ش� �Խñ��� �ڸ�Ʈ ����
		
		sqlMapper.delete("deleteitem", ivo);//�ش� �Խñ� ����
		
		sqlMapper.update("commit");
		
		return SUCCESS;
	}
	
	
	//ȣ�� ��ǰ ����
	public String deletehotel() throws Exception{
		hvo.setNo(no);
		
		sqlMapper.delete("deletecoh", hvo);
		
		sqlMapper.delete("deletehotel", hvo);
		
		sqlMapper.update("commit");
		
		return SUCCESS;
	}
	
	
	//�װ� ��ǰ ����
	public String deleteair() throws Exception{
		avo.setNo(no);
		
		sqlMapper.delete("deletecoa", avo);
		
		sqlMapper.delete("deleteair", avo);
		
		sqlMapper.update("commit");
		
		return SUCCESS;
	}

	
	
	
	
	
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		AdminItemDelete.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		AdminItemDelete.sqlMapper = sqlMapper;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public ItemVO getIvo() {
		return ivo;
	}

	public void setIvo(ItemVO ivo) {
		this.ivo = ivo;
	}

	public HotelVO getHvo() {
		return hvo;
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
	
}
