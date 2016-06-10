package com.linkyuji.dao;

import java.util.List;

import com.linkyuji.bean.FileBean;
import com.linkyuji.bean.FolderBean;

public interface FileDAO {
	public List<FileBean> loadFilebyfolderid(FolderBean fb);
	public void insertFile(FileBean fb);

}
