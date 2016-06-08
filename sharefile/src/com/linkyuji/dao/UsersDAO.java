package com.linkyuji.dao;

import java.util.List;

import com.linkyuji.bean.UsersBean;

public interface UsersDAO {

	public UsersBean getUserByid(String id);

	public List getalluser();

	public void regist(UsersBean user);

	public void editoruser(UsersBean user);

	public void deleteuser(UsersBean user);
}
