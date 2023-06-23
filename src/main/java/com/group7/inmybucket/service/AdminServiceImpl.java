package com.group7.inmybucket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group7.inmybucket.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminDAO dao;
	public void deleteUser(int uid) {
		dao.deleteUser(uid);
	}
}
