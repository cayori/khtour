package item;
import java.util.Date;
public class ContentCOA {
		private int seq_no; // 상품 번호
		private int c_no; //코멘트 번호
		private String c_id;//커멘트단 사용자 id
		private Date c_reg_date; //등록 날짜
		private String c_content; //코멘트 내용
		private int c_grade;
		
	
		public int getSeq_no() {
			return seq_no;
		}
		public void setSeq_no(int seq_no) {
			this.seq_no = seq_no;
		}
		public int getC_no() {
			return c_no;
		}
		public void setC_no(int c_no) {
			this.c_no = c_no;
		}
		public String getC_id() {
			return c_id;
		}
		public void setC_id(String c_id) {
			this.c_id = c_id;
		}
		public Date getC_reg_date() {
			return c_reg_date;
		}
		public int getC_grade() {
			return c_grade;
		}
		public void setC_grade(int c_grade) {
			this.c_grade = c_grade;
		}
		public void setC_reg_date(Date c_reg_date) {
			this.c_reg_date = c_reg_date;
		}
		public String getC_content() {
			return c_content;
		}
		public void setC_content(String c_content) {
			this.c_content = c_content;
		}
		
		
		
}

