package com.group7.inmybucket.dto;

import java.util.List;

public class BucketDTO {
	private int bucket_no;
	private String title;
	private String content;
	private int isvisible;
	private int isgroup;
	private int capacity;
	private String category;
	private String bucket_writedate;
	private int like_count;
	private char progress_status;
	
	private String userid;
	private String usernick;
	
	// 삭제한 이미지 파일명
	private List<String> delimage;

	// 좋아요 눌려있는지
	private Integer like_no;

	
	@Override
	public String toString() {
		return "BucketDTO [bucket_no=" + bucket_no + ", title=" + title + ", content=" + content + ", isvisible="
				+ isvisible + ", isgroup=" + isgroup + ", capacity=" + capacity + ", category=" + category
				+ ", bucket_writedate=" + bucket_writedate + ", like_count=" + like_count + ", progress_status="
				+ progress_status + ", userid=" + userid + ", usernick=" + usernick + ", delimage=" + delimage
				+ ", like_no=" + like_no + "]";
	}

	public int getBucket_no() {
		return bucket_no;
	}

	public void setBucket_no(int bucket_no) {
		this.bucket_no = bucket_no;
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

	public int getIsvisible() {
		return isvisible;
	}

	public void setIsvisible(int isvisible) {
		this.isvisible = isvisible;
	}

	public int getIsgroup() {
		return isgroup;
	}

	public void setIsgroup(int isgroup) {
		this.isgroup = isgroup;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBucket_writedate() {
		return bucket_writedate;
	}

	public void setBucket_writedate(String bucket_writedate) {
		this.bucket_writedate = bucket_writedate;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public char getProgress_status() {
		return progress_status;
	}

	public void setProgress_status(char progress_status) {
		this.progress_status = progress_status;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsernick() {
		return usernick;
	}

	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}

	public List<String> getDelimage() {
		return delimage;
	}

	public void setDelimage(List<String> delimage) {
		this.delimage = delimage;
	}

	public Integer getLike_no() {
		return like_no;
	}

	public void setLike_no(Integer like_no) {
		this.like_no = like_no;
	}
}
