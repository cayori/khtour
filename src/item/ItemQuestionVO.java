package item;
import java.util.Date;
public class ItemQuestionVO {

	private int seq_no; //��ǰ ��ȣ
	private int q_no; //q&a ��ȣ
	private String q_id; //q&a�� �� ����� ���̵�
	private String q_subject; //����
	private String q_pw; //�н�����
	private String q_content; //����
	private Date q_reg_date; //��ϳ�¥
	
	
	public int getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(int seq_no) {
		this.seq_no = seq_no;
	}
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_id() {
		return q_id;
	}
	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_pw() {
		return q_pw;
	}
	public void setQ_pw(String q_pw) {
		this.q_pw = q_pw;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Date getQ_reg_date() {
		return q_reg_date;
	}
	public void setQ_reg_date(Date q_reg_date) {
		this.q_reg_date = q_reg_date;
	} 
	
	
	
}
