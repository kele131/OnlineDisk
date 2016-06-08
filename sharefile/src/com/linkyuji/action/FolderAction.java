package com.linkyuji.action;

import java.util.List;
import java.util.Map;

import com.linkyuji.bean.FileBean;
import com.linkyuji.bean.FolderBean;
import com.linkyuji.bean.UsersBean;
import com.linkyuji.dao.FileDAO;
import com.linkyuji.dao.FolderDAO;
import com.opensymphony.xwork2.ActionContext;

public class FolderAction {
	private FolderBean folder;
	private FolderDAO folderDao;
	private FileDAO fileDao;
	
	public FileDAO getFileDao() {
		return fileDao;
	}

	public void setFileDao(FileDAO fileDao) {
		this.fileDao = fileDao;
	}

	public FolderBean getFolder() {
		return folder;
	}

	public void setFolder(FolderBean folder) {
		this.folder = folder;
	}

	public FolderDAO getFolderDao() {
		return folderDao;
	}

	public void setFolderDao(FolderDAO folderDao) {
		this.folderDao = folderDao;
	}
	
	public String insertFolder(){
		folderDao.insertFolder(folder);
		return "success";
	}
	

	public String loadFolderbyid(){
		ActionContext actionContext = ActionContext.getContext(); // 取到struts容器
		Map session = actionContext.getSession(); // 取得session
		System.out.println(folder.getUserid()+"   "+folder.getIdfolder());
		List<FolderBean> list = folderDao.loadFolderbyid(folder);
		List<FileBean> listfile = fileDao.loadFilebyfolderid(folder);
		session.put("ROOTFOLDER", list);
		session.put("FILELIST", listfile);
		if(folder.getIdfolder()==0){
			session.put("up", "false");
		}else{
			session.put("up", "true");
		}
		return "loadsuccess";
	}
}
