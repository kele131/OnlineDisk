package com.linkyuji.bean;

public class FileBean {
	private int idfile;
	private String filename;
	private int folderid;
	private String userid;
	private String path;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getIdfile() {
		return idfile;
	}
	public void setIdfile(int idfile) {
		this.idfile = idfile;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFolderid() {
		return folderid;
	}
	public void setFolderid(int folderid) {
		this.folderid = folderid;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}

}
