package com.linkyuji.dao;

import java.util.List;

import com.linkyuji.bean.FileBean;
import com.linkyuji.bean.ShareBean;

public interface ShareDAO {
	public void sharefile(ShareBean sb);

	public List<FileBean> loadsharefiles(String id);
	public void deletebyfileid(int id);
}
