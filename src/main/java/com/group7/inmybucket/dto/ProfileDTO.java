package com.group7.inmybucket.dto;

public class ProfileDTO {
	private String userid;
	private String status_message;
	private String user_image_path;
	private boolean profile_visible;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getStatus_message() {
		return status_message;
	}

	public void setStatus_message(String status_message) {
		this.status_message = status_message;
	}

	public String getUser_image_path() {
		return user_image_path;
	}

	public void setUser_image_path(String user_image_path) {
		this.user_image_path = user_image_path;
	}

	public boolean isProfile_visible() {
		return profile_visible;
	}

	public void setProfile_visible(boolean profile_visible) {
		this.profile_visible = profile_visible;
	}

	@Override
	public String toString() {
		return "ProfileDTO [userid=" + userid + ", status_message=" + status_message + ", user_image_path="
				+ user_image_path + ", profile_visible=" + profile_visible + "]";
	}
}
