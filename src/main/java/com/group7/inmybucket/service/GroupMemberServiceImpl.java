package com.group7.inmybucket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group7.inmybucket.dao.GroupMemberDAO;
import com.group7.inmybucket.dto.UserDTO;

@Service
public class GroupMemberServiceImpl implements GroupMemberService {
	@Autowired
	GroupMemberDAO dao;
	
	@Override
	public int addGroupMember(String userid, int groupNo) {
		return dao.addGroupMember(userid, groupNo);
	}

	@Override
	public List<UserDTO> getMembers(int groupNo) {
		return dao.getMembers(groupNo);
	}

	@Override
	public int getMemberCount(int groupNo) {
		return dao.getMemberCount(groupNo);
	}

	@Override
	public int deleteGroupMember(String userid, int groupNo) {
		return dao.deleteGroupMember(userid, groupNo);
	}

	@Override
	public boolean isMember(String userid, int groupNo) {
		return dao.isMember(userid, groupNo);
	}

	@Override
	public boolean inQueue(String userid, int groupNo) {
		return dao.inQueue(userid, groupNo);
	}

	@Override
	public int deleteInQueue(String userid, int groupNo) {
		return dao.deleteInQueue(userid, groupNo);
	}

	@Override
	public List<String> getQueueMembers(int groupNo) {
		return dao.getQueueMembers(groupNo);
	}

}
