package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import air.AirVO;
import hotel.HotelVO;
import item.ItemVO;

public class Main extends ActionSupport {
	public static SqlMapClient sqlMapper;
	public Reader reader;

	private HotelVO hotel = new HotelVO();
	private ItemVO item = new ItemVO();
	private AirVO air = new AirVO();

	public Main() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws Exception {

		hotel = (HotelVO) sqlMapper.queryForObject("selectOneH");
		item = (ItemVO) sqlMapper.queryForObject("selectOneI");// 최신여행상품 빈에 셋팅
		air = (AirVO) sqlMapper.queryForObject("selectOneA");// 최신항공권 빈에 셋팅
		
		return SUCCESS;
	}

	public String introduction() throws Exception {
		return SUCCESS;
	}

	public String weather() throws Exception {
		return SUCCESS;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		Main.sqlMapper = sqlMapper;
	}

	public Reader getReader() {
		return reader;
	}

	public void setReader(Reader reader) {
		this.reader = reader;
	}

	public HotelVO getHotel() {
		return hotel;
	}

	public void setHotel(HotelVO hotel) {
		this.hotel = hotel;
	}

	public ItemVO getItem() {
		return item;
	}

	public void setItem(ItemVO item) {
		this.item = item;
	}

	public AirVO getAir() {
		return air;
	}

	public void setAir(AirVO air) {
		this.air = air;
	}

}