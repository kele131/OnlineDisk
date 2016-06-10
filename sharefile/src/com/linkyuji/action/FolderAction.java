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
		ActionContext actionContext = ActionContext.getContext(); // ȡ��struts����
		Map session = actionContext.getSession(); // ȡ��session
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
		ActionContext actionContext = ActionContext.getContext(); // ȡ��struts����
		Map session = actionContext.getSession(); // ȡ��session
		String path = (String) session.get("path");
		folder.setFolderparent( folder.getIdfolder());
		String str = new String(folder.getFoldername().getBytes("ISO-8859-1"), "UTF-8");
		folder.setFoldername(str);
		folder.setRemark(path + "\\" + str);
		File file = new File("F:\\Share\\User\\"+folder.getRemark());
		if(!file.exists()&&!file.isDirectory()){
			System.out.println("//�����ڣ����Դ���");
			if(file.mkdirs())
			System.out.println("//�����ɹ�");
			folderDao.insertFolder(folder);
		}
		else{
			System.out.println("//�ļ����ڴ���ʧ��");
		}
		System.out.println("createfolder:" + folder.getRemark());		
		
		
		return loadFolderbyid();
	}
	
	public String deleteFolder() {
		
		
		FolderBean foldersql = folderDao.getFolderinfo(folderid);
		String sPath ="F:\\Share\\User\\"+ foldersql.getRemark();
		System.out.println(sPath);
	    File dirFile = new File(sPath);  
	    //���dir��Ӧ���ļ������ڣ����߲���һ��Ŀ¼�����˳�  
	    if (!dirFile.exists() || !dirFile.isDirectory()) {  
	    	System.out.println("a:"+dirFile.exists()+"b:"+dirFile.isDirectory());
	        return loadFolderbyid();  
	    }  
	    
	    //ɾ���ļ����µ������ļ�(������Ŀ¼)  
	    File[] files = dirFile.listFiles();  
	    if(files.length==0){
	    	System.out.println("����ɾ��");
	    	dirFile.delete();
	    	folderDao.deleteFolder(foldersql.getIdfolder());
	    }
	    else
	    	System.out.println("����ɾ��");

		
		
		
		System.out.println(foldersql.getFoldername());
		return loadFolderbyid();
	}
}
