package com.group7.inmybucket.dto;

public class UserDTO {
	public String userid;
	public String password;
	public String username;
	public String tel;
	public String email;
	public String usernick;
	public String registerdate;
	public String user_permission;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsernick() {
		return usernick;
	}

	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}

	public String getRegisterdate() {
		return registerdate;
	}

	public void setRegisterdate(String registerdate) {
		this.registerdate = registerdate;
	}

	public String getUser_permission() {
		return user_permission;
	}

	public void setUser_permission(String user_permission) {
		this.user_permission = user_permission;
	}

	@Override
	public String toString() {
		return "UserDTO [userid=" + userid + ", password=" + password + ", username=" + username + ", tel=" + tel
				+ ", email=" + email + ", usernick=" + usernick + ", registerdate=" + registerdate
				+ ", user_permission=" + user_permission + "]";
	}

}
