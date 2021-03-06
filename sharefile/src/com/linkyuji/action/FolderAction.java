package com.linkyuji.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
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
	
	private int folderid;
	

	public int getFolderid() {
		return folderid;
	}

	public void setFolderid(int folderid) {
		this.folderid = folderid;
	}

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

	public String insertFolder() {
		folderDao.insertFolder(folder);
		return "success";
	}

	public String loadFolderbyid() {
		ActionContext actionContext = ActionContext.getContext(); // 取到struts容器
		Map session = actionContext.getSession(); // 取得session
		System.out.println(folder.getUserid() + "   " + folder.getIdfolder());
		List<FolderBean> list = folderDao.loadFolderbyid(folder);
		List<FileBean> listfile = fileDao.loadFilebyfolderid(folder);
		FolderBean fbsql = folderDao.getFolderinfo(folder.getIdfolder());
		session.put("PARENTID", folder.getIdfolder());
		session.put("ROOTFOLDER", list);
		session.put("FILELIST", listfile);
		if (folder.getIdfolder() == 0) {
			session.put("up", "false");
			session.put("myp", 0);
			session.put("path", folder.getUserid());
		} else {
			session.put("oldp", fbsql.getFolderparent());
			session.put("myp", fbsql.getIdfolder());
			session.put("up", "true");
			session.put("path", fbsql.getRemark());
		}
		return "loadsuccess";
	}

	public String createfolder() throws UnsupportedEncodingException {
		ActionContext actionContext = ActionContext.getContext(); // 取到struts容器
		Map session = actionContext.getSession(); // 取得session
		String path = (String) session.get("path");
		folder.setFolderparent( folder.getIdfolder());
		String str = new String(folder.getFoldername().getBytes("ISO-8859-1"), "UTF-8");
		folder.setFoldername(str);
		folder.setRemark(path + "\\" + str);
		File file = new File("F:\\Share\\User\\"+folder.getRemark());
		if(!file.exists()&&!file.isDirectory()){
			System.out.println("//不存在，可以创建");
			if(file.mkdirs())
			System.out.println("//创建成功");
			folderDao.insertFolder(folder);
		}
		else{
			System.out.println("//文件存在创建失败");
		}
		System.out.println("createfolder:" + folder.getRemark());		
		
		
		return loadFolderbyid();
	}
	
	public String deleteFolder() {
		
		
		FolderBean foldersql = folderDao.getFolderinfo(folderid);
		String sPath ="F:\\Share\\User\\"+ foldersql.getRemark();
		System.out.println(sPath);
	    File dirFile = new File(sPath);  
	    //如果dir对应的文件不存在，或者不是一个目录，则退出  
	    if (!dirFile.exists() || !dirFile.isDirectory()) {  
	    	System.out.println("a:"+dirFile.exists()+"b:"+dirFile.isDirectory());
	        return loadFolderbyid();  
	    }  
	    
	    //删除文件夹下的所有文件(包括子目录)  
	    File[] files = dirFile.listFiles();  
	    if(files.length==0){
	    	System.out.println("可以删除");
	    	dirFile.delete();
	    	folderDao.deleteFolder(foldersql.getIdfolder());
	    }
	    else
	    	System.out.println("不可删除");

		
		
		
		System.out.println(foldersql.getFoldername());
		return loadFolderbyid();
	}
}
