package order;

import order.OrderVO;
import member.MemberVO;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;
import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.ArrayList;

public class Pay extends ActionSupport {

	public Reader reader;
	public static SqlMapClient sqlMapper;	
	private MemberVO member = new MemberVO();
	private OrderVO orderVO = new OrderVO();
	private List<OrderVO> order = new ArrayList<OrderVO>();
	private int seq_no;
	private String id;
	private String name;
	private int price;
	private int amount;
	private String checkin;
	private String checkout;
	private String day;
	private String ad;
	private String dd;
	private String content;
	private String tel;
	private String kinds;
	private String People;
	private String room;
	private String image1;
	public Pay()throws Exception{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();	
	}
	
	public String execute() throws Exception {
		if(getPeople() != null){orderVO.setPrice(Integer.parseInt(getPeople())*getPrice());}
		if(getPeople() != null){orderVO.setAmount(Integer.parseInt(getPeople()));}
		if(getRoom() != null){orderVO.setPrice(Integer.parseInt(getPeople())*getPrice()+Integer.parseInt(getRoom())*getPrice());}
		orderVO.setSeq_no(getSeq_no());
		orderVO.setId(getId());
		orderVO.setName(getName());
		orderVO.setCheckin(getCheckin());
		orderVO.setCheckout(getCheckout());
		orderVO.setContent(getContent());
		orderVO.setDay(getDay());
		orderVO.setDd(getDd());
		orderVO.setAd(getAd());
		orderVO.setKinds(getKinds());
		orderVO.setImage1(getImage1());
		sqlMapper.insert("insertorder",orderVO);
		return SUCCESS;
	}
	
	public String payResult() throws Exception {
		member.setId(getId());
		member= (MemberVO)sqlMapper.queryForObject("selectmember",member);
		order = sqlMapper.queryForList("selectorder",getId());
		
		return SUCCESS;
	}
	
	
	public String payUpdate() throws Exception {
	
		orderVO.setSeq_no(getSeq_no());
		orderVO.setId(getId());
		orderVO.setName(getName());
		orderVO.setTel(getTel());
		sqlMapper.update("updateorder",orderVO);
		sqlMapper.update("addcocount", seq_no);
		return SUCCESS;
	}
	
	
	public String payDelete()throws Exception{
		
		orderVO.setId(getId());
		orderVO.setSeq_no(getSeq_no());
		
		sqlMapper.delete("deleteorder", orderVO);
		
		return SUCCESS;
	}
	public OrderVO getOrderVO() {
		return orderVO;
	}

	public void setOrderVO(OrderVO orderVO) {
		this.orderVO = orderVO;
	}

	public int getSeq_no() {
		return seq_no;
	}

	public void setSeq_no(int seq_no) {
		this.seq_no = seq_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getAd() {
		return ad;
	}

	public void setAd(String ad) {
		this.ad = ad;
	}

	public String getDd() {
		return dd;
	}

	public void setDd(String dd) {
		this.dd = dd;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public List<OrderVO> getOrder() {
		return order;
	}

	public void setOrder(List<OrderVO> order) {
		this.order = order;
	}

	public String getKinds() {
		return kinds;
	}

	public void setKinds(String kinds) {
		this.kinds = kinds;
	}

	public String getPeople() {
		return People;
	}

	public void setPeople(String people) {
		People = people;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	
}
