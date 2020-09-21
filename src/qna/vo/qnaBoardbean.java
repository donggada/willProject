package qna.vo;

import java.sql.Date;

public class qnaBoardbean {
	
	
	
	private int qnaBoard_num;
	private String qnaBoard_id;
	private String qnaBoard_pass;
	private String qnaBoard_subject;
	private String qnaBoard_content;
	private String qnaBoard_file;
	private Date qnaBoard_date;
	private int qnaBoard_re_ref;
	private int qnaBoard_re_lev;
	private int qnaBoard_re_seq;
	private String qnaboard_reply;
	private int qnaBoard_readcount;
	private String qnaBaord_tag;
	private Date qnaBoard_reply_date;

	

	
	
	

	
	public Date getQnaBoard_reply_date() {
		return qnaBoard_reply_date;
	}
	public void setQnaBoard_reply_date(Date qnaBoard_reply_date) {
		this.qnaBoard_reply_date = qnaBoard_reply_date;
	}
	public String getQnaboard_reply() {
		return qnaboard_reply;
	}
	public void setQnaboard_reply(String qnaboard_reply) {
		this.qnaboard_reply = qnaboard_reply;
	}
	public String getQnaBaord_tag() {
		return qnaBaord_tag;
	}
	public void setQnaBaord_tag(String qnaBaord_tag) {
		this.qnaBaord_tag = qnaBaord_tag;
	}
	public int getQnaBoard_readcount() {
		return qnaBoard_readcount;
	}
	public void setQnaBoard_readcount(int qnaBoard_readcount) {
		this.qnaBoard_readcount = qnaBoard_readcount;
	}
	public int getQnaBoard_re_seq() {
		return qnaBoard_re_seq;
	}
	public void setQnaBoard_re_seq(int qnaBoard_re_seq) {
		this.qnaBoard_re_seq = qnaBoard_re_seq;
	}
	public int getQnaBoard_re_ref() {
		return qnaBoard_re_ref;
	}
	public void setQnaBoard_re_ref(int qnaBoard_re_ref) {
		this.qnaBoard_re_ref = qnaBoard_re_ref;
	}
	public int getQnaBoard_re_lev() {
		return qnaBoard_re_lev;
	}
	public void setQnaBoard_re_lev(int qnaBoard_re_lev) {
		this.qnaBoard_re_lev = qnaBoard_re_lev;
	}
	
	
	public int getQnaBoard_num() {
		return qnaBoard_num;
	}
	public void setQnaBoard_num(int qnaBoard_num) {
		this.qnaBoard_num = qnaBoard_num;
	}
	public String getQnaBoard_id() {
		return qnaBoard_id;
	}
	public void setQnaBoard_id(String qnaBoard_id) {
		this.qnaBoard_id = qnaBoard_id;
	}
	public String getQnaBoard_pass() {
		return qnaBoard_pass;
	}
	public void setQnaBoard_pass(String qnaBoard_pass) {
		this.qnaBoard_pass = qnaBoard_pass;
	}
	public String getQnaBoard_subject() {
		return qnaBoard_subject;
	}
	public void setQnaBoard_subject(String qnaBoard_subject) {
		this.qnaBoard_subject = qnaBoard_subject;
	}
	public String getQnaBoard_content() {
		return qnaBoard_content;
	}
	public void setQnaBoard_content(String qnaBoard_content) {
		this.qnaBoard_content = qnaBoard_content;
	}
	public String getQnaBoard_file() {
		return qnaBoard_file;
	}
	public void setQnaBoard_file(String qnaBoard_file) {
		this.qnaBoard_file = qnaBoard_file;
	}
	public Date getQnaBoard_date() {
		return qnaBoard_date;
	}
	public void setQnaBoard_date(Date qnaBoard_date) {
		this.qnaBoard_date = qnaBoard_date;
	}
	
	
	
	
	
}
