package com.group7.inmybucket.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.group7.inmybucket.dto.FeedDTO;
import com.group7.inmybucket.vo.FilteringVO;

public interface FeedService {
	public int allBucketCount();
	public int accomplishedBucketCount();
	public int feedCount(FilteringVO vo);
	public List<FeedDTO> listAll(FilteringVO vo);
	public List<FeedDTO> userList(FilteringVO vo);
	public int userCount(FilteringVO vo);
}
