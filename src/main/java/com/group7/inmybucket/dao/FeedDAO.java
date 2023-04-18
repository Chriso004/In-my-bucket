package com.group7.inmybucket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.group7.inmybucket.dto.FeedDTO;
import com.group7.inmybucket.vo.FilteringVO;

public interface FeedDAO {
	
	public int allBucketCount(); // 모든 버킷리스트 수
	public int accomplishedBucketCount(); // 달성한 모든 버킷리스트 수
	public int feedCount(FilteringVO vo); // 보여지는 레코드 수
	public List<FeedDTO> listAll(FilteringVO vo); // 검색한 피드리스트
	public List<FeedDTO> userList(FilteringVO vo); // 검색한 사용자리스트
	public int userCount(FilteringVO vo); // 검색한 사용자 수
}
