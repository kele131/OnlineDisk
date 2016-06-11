package com.linkyuji.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import com.linkyuji.bean.FileBean;
import com.linkyuji.bean.FolderBean;
import com.linkyuji.bean.UsersBean;
import com.linkyuji.dao.FileDAO;
import com.linkyuji.dao.ShareDAO;
import com.opensymphony.xwork2.ActionContext;

public class FileAction {
	private FileBean filebean;
	private ShareDAO shareDao;
	private FileDAO fileDao;
	private int fileid;
	private File[] file;
	private InputStream inputStream;
	// 提交过来的file的名字
	private String[] fileFileName;
	private String fileName;
	

	public ShareDAO getShareDao() {
		return shareDao;
	}

	public void setShareDao(ShareDAO shareDao) {
		this.shareDao = shareDao;
	}

	public FileBean getFilebean() {
		return filebean;
	}

	public void setFilebean(FileBean filebean) {
		this.filebean = filebean;
	}

	public FileDAO getFileDao() {
		return fileDao;
	}

	public void setFileDao(FileDAO fileDao) {
		this.fileDao = fileDao;
	}

	public int getFileid() {
		return fileid;
	}

	public void setFileid(int fileid) {
		this.fileid = fileid;
	}

	public File[] getFile() {
		return file;
	}

	public void setFile(File[] file) {
		this.file = file;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String[] getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String[] fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String upload() throws Exception {
		filebean = new FileBean();
		ActionContext actionContext = ActionContext.getContext(); // 取到struts容器
		Map session = actionContext.getSession(); // 取得session
		UsersBean ub = (UsersBean) session.get("USER");
		String path = "F:\\Share\\User\\" + (String) session.get("path");
		int upp = 0;
		try {
			upp = Integer.parseInt(session.get("myp").toString());
		} catch (Exception e) {
		}
		filebean.setUserid(ub.getUserid());
		for (int i = 0; i < file.length; i++) {

			System.out.println(path + "\\" + fileFileName[i]);
			File thefile = new File(path + "\\" + fileFileName[i]);
			if(thefile.exists())
				return "filefail";
			filebean.setFilename(fileFileName[i]);
			filebean.setFolderid(upp);
			filebean.setPath(path + "\\" + fileFileName[i]);
			InputStream is = new FileInputStream(file[i]);

			OutputStream os = new FileOutputStream(new File(path, fileFileName[i]));
			
			byte[] buffer = new byte[500];

			@SuppressWarnings("unused")
			int length = 0;

			while (-1 != (length = is.read(buffer, 0, buffer.length))) {
				os.write(buffer);
			}

			os.close();
			is.close();
			fileDao.insertFile(filebean);
		}

		return "filesuccess";
	}

	public String download() throws UnsupportedEncodingException {

		FileBean filebeansql = fileDao.getFilebyid(fileid);
		fileName= new String(filebeansql.getFilename().getBytes(), "ISO8859-1");
		System.out.println(fileName);

		try {
			File filedownload = new File(filebeansql.getPath());

			inputStream = new FileInputStream(filedownload);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "false";
		}

	}
	public String delete(){
		FileBean filebeansql = fileDao.getFilebyid(fileid);
		try{
	    File dfile = new File(filebeansql.getPath());  
	    // 路径为文件且不为空则进行删除  
	    if (dfile.isFile() && dfile.exists()) {  
	    	dfile.delete();  
	    } 	
		}catch(Exception e){}
	    fileDao.deleteFile(fileid);
	    shareDao.deletebyfileid(fileid);
		return "filesuccess";
	}

}
