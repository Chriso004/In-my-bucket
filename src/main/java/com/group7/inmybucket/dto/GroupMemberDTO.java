package com.group7.inmybucket.dto;

public class GroupMemberDTO {
	private String userid;
	private int group_no;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getGroup_no() {
		return group_no;
	}

	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}

	@Override
	public String toString() {
		return "GroupMemberDTO [userid=" + userid + ", group_no=" + group_no + "]";
	}

}
