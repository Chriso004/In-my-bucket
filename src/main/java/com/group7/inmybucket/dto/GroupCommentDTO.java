package com.group7.inmybucket.dto;

public class GroupCommentDTO {
	private int group_comment_no;
	private int group_no;
	private String userid;
	private int group_board_no;
	private String group_comment_content;
	private String group_comment_writedate;
	private String usernick;

	public int getGroup_comment_no() {
		return group_comment_no;
	}

	public void setGroup_comment_no(int group_comment_no) {
		this.group_comment_no = group_comment_no;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getGroup_board_no() {
		return group_board_no;
	}

	public void setGroup_board_no(int group_board_no) {
		this.group_board_no = group_board_no;
	}

	public String getGroup_comment_content() {
		return group_comment_content;
	}

	public void setGroup_comment_content(String group_comment_content) {
		this.group_comment_content = group_comment_content;
	}

	public String getGroup_comment_writedate() {
		return group_comment_writedate;
	}

	public void setGroup_comment_writedate(String group_comment_writedate) {
		this.group_comment_writedate = group_comment_writedate;
	}

	public String getUsernick() {
		return usernick;
	}

	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}

	@Override
	public String toString() {
		return "GroupCommentDTO [group_comment_no=" + group_comment_no + ", group_no=" + group_no + ", userid=" + userid
				+ ", group_board_no=" + group_board_no + ", group_comment_content=" + group_comment_content
				+ ", group_comment_writedate=" + group_comment_writedate + ", usernick=" + usernick + "]";
	}

}
