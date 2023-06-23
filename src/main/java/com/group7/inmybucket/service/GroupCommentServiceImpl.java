package com.group7.inmybucket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group7.inmybucket.dao.GroupCommentDAO;
import com.group7.inmybucket.dto.GroupCommentDTO;

@Service
public class GroupCommentServiceImpl implements GroupCommentService{
	@Autowired
	GroupCommentDAO dao;
	
	@Override
	public List<GroupCommentDTO> getGroupComment(int groupBoardNo) {
		return dao.getGroupComment(groupBoardNo);
	}

	@Override
	public int postGroupComment(GroupCommentDTO dto) {
		return dao.postGroupComment(dto);
	}

	@Override
	public int updateGroupComment(GroupCommentDTO dto) {
		return dao.updateGroupComment(dto);
	}

	@Override
	public int deleteGroupComment(int groupCommentNo) {
		return dao.deleteGroupComment(groupCommentNo);
	}

	@Override
	public int getGroupCommentCnt(int boardNo) {
		return dao.getGroupCommentCnt(boardNo);
	}

	@Override
	public boolean isAuthor(String userid, int boardNo) {
		return dao.isAuthor(userid, boardNo);
	}

}
