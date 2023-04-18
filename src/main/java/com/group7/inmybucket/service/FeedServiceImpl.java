package com.group7.inmybucket.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.group7.inmybucket.dao.FeedDAO;
import com.group7.inmybucket.dto.FeedDTO;
import com.group7.inmybucket.vo.FilteringVO;

@Service
public class FeedServiceImpl implements FeedService {
	@Inject
	FeedDAO dao;

	@Override
	public int feedCount(FilteringVO vo) {
		return dao.feedCount(vo);
	}

	@Override
	public List<FeedDTO> listAll(FilteringVO vo) {
		return dao.listAll(vo);
	}

	@Override
	public int allBucketCount() {
		return dao.allBucketCount();
	}

	@Override
	public int accomplishedBucketCount() {
		return dao.accomplishedBucketCount();
	}

	@Override
	public List<FeedDTO> userList(FilteringVO vo) {
		return dao.userList(vo);
	}

	@Override
	public int userCount(FilteringVO vo) {
		return dao.userCount(vo);
	}
}
