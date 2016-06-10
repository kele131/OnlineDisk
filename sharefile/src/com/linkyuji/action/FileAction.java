package com.linkyuji.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import com.linkyuji.bean.FileBean;
import com.linkyuji.bean.FolderBean;
import com.linkyuji.bean.UsersBean;
import com.linkyuji.dao.FileDAO;
import com.opensymphony.xwork2.ActionContext;

public class FileAction {
	private FileBean filebean;
	private FileDAO fileDao;

	private File[] file;

	// �ύ������file������
	private String[] fileFileName;

	// �ύ������file��MIME����
	private String[] fileContentType;

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

	public File[] getFile() {
		return file;
	}

	public void setFile(File[] file) {
		this.file = file;
	}

	public String[] getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String[] fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String[] getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String[] fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String upload() throws Exception {
		ActionContext actionContext = ActionContext.getContext(); // ȡ��struts����
		Map session = actionContext.getSession(); // ȡ��session
		String path = "F:\\Share\\User\\"+(String) session.get("path");
		for (int i = 0; i < file.length; i++) {
			
			System.out.println(path + "\\"+fileFileName[i]);
			 InputStream is = new FileInputStream(file[i]);
			
			 OutputStream os = new FileOutputStream(new File(path,
			 fileFileName[i]));
			
			 byte[] buffer = new byte[500];
			
			 @SuppressWarnings("unused")
			 int length = 0;
			
			 while(-1 != (length = is.read(buffer, 0, buffer.length)))
			 {
			 os.write(buffer);
			 }
			
			 os.close();
			 is.close();
		}

		return "";
	}
}
