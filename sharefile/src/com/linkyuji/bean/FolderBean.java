package com.linkyuji.bean;

public class FolderBean {
	private int idfolder;
	private String userid;
	private String foldername;
	private String remark;
	private int folderparent;
	public int getIdfolder() {
		return idfolder;
	}
	public void setIdfolder(int idfolder) {
		this.idfolder = idfolder;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getFoldername() {
		return foldername;
	}
	public void setFoldername(String foldername) {
		this.foldername = foldername;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getFolderparent() {
		return folderparent;
	}
	public void setFolderparent(int folderparent) {
		this.folderparent = folderparent;
	}
	
}
