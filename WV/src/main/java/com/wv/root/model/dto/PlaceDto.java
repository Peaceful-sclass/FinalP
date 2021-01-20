package com.wv.root.model.dto;

public class PlaceDto {
	private int pno; 
    private double lng;
    private double lat;
    private String ptitle; 
    private String pcontent; 
    private String soket; 
    private String com; 
    private String people; 
    private int plike; 
    private int memberno;
	public PlaceDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PlaceDto(int pno, double lng, double lat, String ptitle, String pcontent, String soket, String com,
			String people, int plike, int memberno) {
		super();
		this.pno = pno;
		this.lng = lng;
		this.lat = lat;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.soket = soket;
		this.com = com;
		this.people = people;
		this.plike = plike;
		this.memberno = memberno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getSoket() {
		return soket;
	}
	public void setSoket(String soket) {
		this.soket = soket;
	}
	public String getCom() {
		return com;
	}
	public void setCom(String com) {
		this.com = com;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public int getPlike() {
		return plike;
	}
	public void setPlike(int plike) {
		this.plike = plike;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	
	
    
    
}
