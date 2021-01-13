package com.wv.root.model.dto;


public class CpDto {
	private int totalData;			//총개수 : dao에서 가져오기
	private int dataPerPage = 20; 	//데이터개수
	private int pagePerscreen = 10; //초기세팅값
	private int totalPage;			//총page
	private int currentPage = 1;
	private int pageGroup;			//page그룹sequence
	private int first;
	private int last;	
	private int prev;	//이전page
	private int next;	//이후page
	private String category;	
	
	public CpDto() {
		super();
	}

	public CpDto(int totalData, int currentPage) {
		super();
		this.totalData = totalData;
		this.totalPage = (int)(Math.ceil((double)totalData/dataPerPage));
		this.currentPage = currentPage;
		this.pageGroup = (int)(Math.ceil((double)currentPage/pagePerscreen));
		this.last = pageGroup*pagePerscreen;
		this.first = (last-pagePerscreen)+1;
		this.prev = first-1;
		this.next = last+1;
	}
	
	//paging시 새로운 페이지정보를 받아서 전체 데이터를 갱신
	public void cpdtoChg(int totalData, int currentPage) {
		this.totalData = totalData;
		this.totalPage = (int)(Math.ceil((double)totalData/dataPerPage));
		this.currentPage = currentPage;
		this.pageGroup = (int)(Math.ceil((double)currentPage/pagePerscreen));
		this.last = pageGroup*pagePerscreen;
		this.first = (last-pagePerscreen)+1;
		this.prev = first-1;
		this.next = last+1;
	}
	

	public int getTotalData() {
		return totalData;
	}

	public void setTotalData(int totalData) {
		this.totalData = totalData;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getDataPerPage() {
		return dataPerPage;
	}

	public void setDataPerPage(int dataPerPage) {
		this.dataPerPage = dataPerPage;
	}

	public int getPagePerscreen() {
		return pagePerscreen;
	}

	public void setPagePerscreen(int pagePerscreen) {
		this.pagePerscreen = pagePerscreen;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageGroup() {
		return pageGroup;
	}

	public void setPageGroup(int currentPage) {
		this.pageGroup = (int)Math.ceil(currentPage/pagePerscreen);
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "CpDto [totalData=" + totalData + ", dataPerPage=" + dataPerPage + ", pagePerscreen=" + pagePerscreen
				+ ", totalPage=" + totalPage + ", currentPage=" + currentPage + ", pageGroup=" + pageGroup + ", first="
				+ first + ", last=" + last + ", prev=" + prev + ", next=" + next + ", category=" + category + "]";
	}


	
	
	
	

	
	
}
