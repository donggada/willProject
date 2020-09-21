package review.vo;

import java.util.Date;

public class ReviewBean {
	
	private int review_num; //리뷰글 번호
	private int book_num;	  //예약번호
	private String member_id; //회원ID
	private String car_id;	  //차량정보
	private String pickup_date;	//인수일
	private String end_date;	//반납일
	
	private String review_subject; //리뷰글제목
	private String review_content; //리뷰글내용
	private String review_file;	   //리뷰글 첨부파일
	private int review_readcount;  //조회수
	private int review_recocount;  //추천수
	
	private Date review_date;	   //글 작성일
	private String review_pass;	   //글 비밀번호
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCar_id() {
		return car_id;
	}
	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}
	public String getPickup_date() {
		return pickup_date;
	}
	public void setPickup_date(String pickup_date) {
		this.pickup_date = pickup_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_file() {
		return review_file;
	}
	public void setReview_file(String review_file) {
		this.review_file = review_file;
	}
	public int getReview_readcount() {
		return review_readcount;
	}
	public void setReview_readcount(int review_readcount) {
		this.review_readcount = review_readcount;
	}
	public int getReview_recocount() {
		return review_recocount;
	}
	public void setReview_recocount(int review_recocount) {
		this.review_recocount = review_recocount;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getReview_pass() {
		return review_pass;
	}
	public void setReview_pass(String review_pass) {
		this.review_pass = review_pass;
	}
	
}
