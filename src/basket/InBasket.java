package basket;

import air.AirVO;
import hotel.HotelVO;
import item.ItemVO;

public class InBasket {

	BasketVO bvo = new BasketVO();

	ItemVO ivo = new ItemVO();
	HotelVO hvo = new HotelVO();
	AirVO avo = new AirVO();

	public BasketVO itemBasket(ItemVO ivo) {
		bvo.setSeq_no(ivo.getNo());
		bvo.setName(ivo.getName());
		bvo.setPrice(ivo.getPrice());
		bvo.setContent(ivo.getContent());
		bvo.setCountry(ivo.getCountry());
		bvo.setRegion(ivo.getRegion());
		bvo.setImage1(ivo.getImage1());
		bvo.setImage2(ivo.getImage2());
		bvo.setImage3(ivo.getImage3());
		bvo.setReg_date(ivo.getReg_date());
		bvo.setAmount(ivo.getAmount());
		bvo.setDay(ivo.getDay());
		bvo.setTel(ivo.getTel());
		bvo.setReadcount(ivo.getReadcount());
		bvo.setGrade(ivo.getGrade());
		bvo.setHai(ivo.getHai());
		bvo.setImage1(ivo.getImage1());
		return bvo;

	}

	public BasketVO hotelBasket(HotelVO hvo){
		bvo.setSeq_no(hvo.getNo());
		bvo.setName(hvo.getName());
		bvo.setPrice(hvo.getPrice());
		bvo.setContent(hvo.getContent());
		bvo.setCountry(hvo.getCountry());
		bvo.setRegion(hvo.getRegion());
		bvo.setImage1(hvo.getImage1());
		bvo.setImage2(hvo.getImage2());
		bvo.setImage3(hvo.getImage3());
		bvo.setReg_date(hvo.getReg_date());
		bvo.setAmount(hvo.getAmount());
		bvo.setDay(hvo.getDay());
		bvo.setTel(hvo.getTel());
		bvo.setKinds(hvo.getKinds());
		bvo.setReadcount(hvo.getReadcount());
		bvo.setGrade(hvo.getGrade());
		bvo.setCheckin(hvo.getCheckin());
		bvo.setCheckout(hvo.getCheckout());
		bvo.setRoom(hvo.getRoom());
		bvo.setPeople(hvo.getPeople());
		bvo.setImage1(hvo.getImage1());
		return bvo;
	}
	
	
	public BasketVO airBasket(AirVO avo){
		bvo.setSeq_no(avo.getNo());
		bvo.setName(avo.getName());
		bvo.setPrice(avo.getPrice());
		bvo.setContent(avo.getContent());
		bvo.setCountry(avo.getCountry());
		bvo.setRegion(avo.getRegion());
		bvo.setImage1(avo.getImage1());
		bvo.setImage2(avo.getImage2());
		bvo.setImage3(avo.getImage3());
		bvo.setReg_date(avo.getReg_date());
		bvo.setAmount(avo.getAmount());
		bvo.setKinds(avo.getKinds());
		bvo.setReadcount(avo.getReadcount());
		bvo.setGrade(avo.getGrade());
		bvo.setAd(avo.getAd());
		bvo.setDd(avo.getDd());
		bvo.setSeat(avo.getSeat());
		bvo.setAir(avo.getAir());
		bvo.setImage1(avo.getImage1());
		return bvo;
	}

}
