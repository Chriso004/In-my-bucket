package com.group7.inmybucket.dto;

public class GroupBoardDTO {
	private int group_board_no;
	private int group_no;
	private String userid;
	private String group_title;
	private String group_content;
	private String group_writedate;
	private boolean isnotice;
	private String usernick;

	public int getGroup_board_no() {
		return group_board_no;
	}

	public void setGroup_board_no(int group_board_no) {
		this.group_board_no = group_board_no;
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

	public String getGroup_title() {
		return group_title;
	}

	public void setGroup_title(String group_title) {
		this.group_title = group_title;
	}

	public String getGroup_content() {
		return group_content;
	}

	public void setGroup_content(String group_content) {
		this.group_content = group_content;
	}

	public String getGroup_writedate() {
		return group_writedate;
	}

	public void setGroup_writedate(String group_writedate) {      
		this.group_writedate = group_writedate;
	}

	public boolean isIsnotice() {
		return isnotice;
	}

	public void setIsnotice(boolean isnotice) {
		this.isnotice = isnotice;
	}

	public String getUsernick() {
		return usernick;
	}

	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}

	@Override
	public String toString() {
		return "GroupBoardDTO [group_board_no=" + group_board_no + ", group_no=" + group_no + ", userid=" + userid
				+ ", group_title=" + group_title + ", group_content=" + group_content + ", group_writedate="
				+ group_writedate + ", isnotice=" + isnotice + ", usernick=" + usernick + "]";
	}
	
}
