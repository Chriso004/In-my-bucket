package com.group7.inmybucket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group7.inmybucket.dao.GroupBoardDAO;
import com.group7.inmybucket.dto.BucketDTO;
import com.group7.inmybucket.dto.GroupBoardDTO;

@Service
public class GroupBoardServiceImpl implements GroupBoardService {
	@Autowired
	GroupBoardDAO dao;

	@Override
	public BucketDTO getBucket(int groupNo) {
		return dao.getBucket(groupNo);
	}
	
	@Override
	public List<GroupBoardDTO> getGroupBoard(int groupNo) {
		return dao.getGroupBoard(groupNo);
	}

	@Override
	public List<GroupBoardDTO> getGroupNotice(int groupNo) {
		return dao.getGroupNotice(groupNo);
	}

	@Override
	public int postGroupBoard(GroupBoardDTO dto) {
		return dao.postGroupBoard(dto);
	}

	@Override
	public int updateGroupBoard(GroupBoardDTO dto) {
		return dao.updateGroupBoard(dto);
	}

	@Override
	public int deleteGroupBoard(int boardNo, int groupNo) {
		return dao.deleteGroupBoard(boardNo, groupNo);
	}

	@Override
	public String getNickname(String userid) {
		return dao.getNickname(userid);
	}

	@Override
	public GroupBoardDTO getBoardByNo(int boardNo) {
		return dao.getBoardByNo(boardNo);
	}

	@Override
	public int getTotalNoticeCnt(int groupNo) {
		return dao.getTotalNoticeCnt(groupNo);
	}

	@Override
	public int getTotalBoardCnt(int groupNo) {
		return dao.getTotalBoardCnt(groupNo);
	}

	@Override
	public boolean isAdmin(String userid, int groupNo) {
		return dao.isAdmin(userid, groupNo);
	}

	@Override
	public boolean isAuthor(String userid, int boardNo) {
		return dao.isAuthor(userid, boardNo);
	}
}
