package com.linkyuji.action;

import java.util.List;
import java.util.Map;

import com.linkyuji.bean.FileBean;
import com.linkyuji.bean.ShareBean;
import com.linkyuji.dao.FileDAO;
import com.linkyuji.dao.ShareDAO;
import com.opensymphony.xwork2.ActionContext;

public class ShareAction {
	private ShareDAO shareDao;
	private FileDAO fileDao;
	private ShareBean share;
	private int fileid;
	private String userid;

	public ShareDAO getShareDao() {
		return shareDao;
	}

	public void setShareDao(ShareDAO shareDao) {
		this.shareDao = shareDao;
	}

	public FileDAO getFileDao() {
		return fileDao;
	}

	public void setFileDao(FileDAO fileDao) {
		this.fileDao = fileDao;
	}

	public ShareBean getShare() {
		return share;
	}

	public void setShare(ShareBean share) {
		this.share = share;
	}

	public int getFileid() {
		return fileid;
	}

	public void setFileid(int fileid) {
		this.fileid = fileid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String shareload() {
		
		FileBean filesql = fileDao.getFilebyid(fileid);
		System.out.println(filesql.getFilename());
		ActionContext actionContext = ActionContext.getContext(); // 取到struts容器
		Map session = actionContext.getSession(); // 取得session
		session.put("sharefile", filesql);
		
		return "sharesuccess";
	}
	
	public String share(){
		System.out.println(fileid+"   "+userid);
		share = new ShareBean();
		share.setUserid(userid);
		share.setFileid(fileid);
		shareDao.sharefile(share);
		return "succ";
	}
	
	public String loadfiles(){
		System.out.println(userid);
		List<FileBean> list =  shareDao.loadsharefiles(userid);
		ActionContext actionContext = ActionContext.getContext(); // 取到struts容器
		Map session = actionContext.getSession(); // 取得session
		session.put("sharelist", list);
		return "sharelist";
	}
}
