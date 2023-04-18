package com.group7.inmybucket.dto;


public class FeedDTO {
	private String userid;
	private int no;
	private int isgroup;
	private int visible;
	private String title;
	private String content;
	private String thumbnail;
	private String writedate;
	private String progress;
	private int like_count;
	private String category;
	
	private String usernick;
	private String user_image_path;
	
	
	
	
	
	@Override
	public String toString() {
		return "FeedDTO [userid=" + userid + ", no=" + no + ", isgroup=" + isgroup + ", visible=" + visible + ", title="
				+ title + ", content=" + content + ", thumbnail=" + thumbnail + ", writedate=" + writedate
				+ ", progress=" + progress + ", like_count=" + like_count + ", category=" + category + ", usernick="
				+ usernick + ", user_image_path=" + user_image_path + "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getIsgroup() {
		return isgroup;
	}
	public void setIsgroup(int isgroup) {
		this.isgroup = isgroup;
	}
	public int getVisible() {
		return visible;
	}
	public void setVisible(int visible) {
		this.visible = visible;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getwritedate() {
		return writedate;
	}
	public void setwritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUsernick() {
		return usernick;
	}
	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}
	public String getUser_image_path() {
		return user_image_path;
	}
	public void setUser_image_path(String user_image_path) {
		this.user_image_path = user_image_path;
	}
	
	
	
	
	
}
