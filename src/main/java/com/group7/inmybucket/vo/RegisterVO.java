package com.group7.inmybucket.vo;

public class RegisterVO {
	private String userid;
	private String userpwd;
	private String username;
	private String email;
	private String registerdate;
	private String usernick;
	private String permission;
	
	
	
	

	

	@Override
	public String toString() {
		return "RegisterVO [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", email=" + email
				+ ", registerdate=" + registerdate + ", usernick=" + usernick + ", permission=" + permission + "]";
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getUsernick() {
		return usernick;
	}

	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegisterdate() {
		return registerdate;
	}
	public void setRegisterdate(String registerdate) {
		this.registerdate = registerdate;
	}
	
	
}
