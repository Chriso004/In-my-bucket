package com.group7.inmybucket.vo;

public class FilteringVO {
	final int PAGE_FEED_COUNT = 12; // 한 페이지에 보여줄 피드 개수
	
	private int feedCount; // 보여진 총 피드 개수
	private int userCount; // 검색된 유저 수
	private int pageNum = 1; // 보여줄 페이지
	private int totalPageCount; // 전체 페이지 개수
	private int startRowNum; // 보여줄 페이지의 시작 rownum -> 0부터
	private int endRowNum; // 보여줄 페이지의 끝 rownum
	
	
	// 검색 필터링 변수
	private String category;
	private String listFilter;
	private String listSort;
	private String searchWord;
	
	
	
	
	@Override
	public String toString() {
		return "FilteringVO [PAGE_FEED_COUNT=" + PAGE_FEED_COUNT + ", feedCount=" + feedCount + ", userCount="
				+ userCount + ", pageNum=" + pageNum + ", totalPageCount=" + totalPageCount + ", startRowNum="
				+ startRowNum + ", endRowNum=" + endRowNum + ", category=" + category + ", listFilter=" + listFilter
				+ ", listSort=" + listSort + ", searchWord=" + searchWord + "]";
	}
	public int getFeedCount() {
		return feedCount;
	}
	public void setFeedCount(int feedCount) {
		this.feedCount = feedCount;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getListFilter() {
		return listFilter;
	}
	public void setListFilter(String listFilter) {
		this.listFilter = listFilter;
	}
	public String getListSort() {
		return listSort;
	}
	public void setListSort(String listSort) {
		this.listSort = listSort;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPAGE_FEED_COUNT() {
		return PAGE_FEED_COUNT;
	}
	public int getStartRowNum() {
		startRowNum = 0 + (pageNum - 1) * PAGE_FEED_COUNT;
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getEndRowNum() {
		endRowNum = pageNum * PAGE_FEED_COUNT;
		return endRowNum;
	}
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	public int getTotalPageCount() {
		totalPageCount = (int)Math.ceil(feedCount/(double)PAGE_FEED_COUNT);
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getUserCount() {
		return userCount;
	}
	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}

	
	
}
