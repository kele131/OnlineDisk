package com.linkyuji.action;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.linkyuji.bean.UsersBean;
import com.linkyuji.dao.UsersDAO;
import com.opensymphony.xwork2.ActionContext;

public class UserAction {
	private UsersDAO usersDao;
	private UsersBean user;

	public UsersDAO getUsersDao() {
		return usersDao;
	}

	public void setUsersDao(UsersDAO usersDao) {
		this.usersDao = usersDao;
	}

	public UsersBean getUser() {
		return user;
	}

	public void setUser(UsersBean user) {
		this.user = user;
	}

	public String signin() {
		String id = user.getUserid();
		String password = user.getUserpsw();
//		System.out.println(id + "    " + password);
		UsersBean sqluser = usersDao.getUserByid(id);
		if (sqluser == null) {
			System.out.println("NULL");
			return "error";
		}
		if (sqluser.getUserpsw().equals(password)) {
//			System.out.println(sqluser.getIdusers() + " " + sqluser.getUsertype());
			int type = sqluser.getUsertype();
			ActionContext actionContext = ActionContext.getContext(); // ȡ��struts����
			Map session = actionContext.getSession(); // ȡ��session
			session.put("USER", sqluser); // ���û����ݷ���session
			return "success";
		} else {
			return "error";
		}
	}

	public String regist() {
		String id = user.getUserid();
		String password = user.getUserpsw();
		UsersBean s = usersDao.getUserByid(id);
		System.out.println(user.getUserid() + "   " + user.getUserpsw());
		if (s == null) {
			usersDao.regist(user);
			File file = new File("F:\\Share\\User\\"+id);
			if(!file.exists()&&!file.isDirectory()){
				System.out.println("//�����ڣ����Դ���");
				if(file.mkdirs())
				System.out.println("//�����ɹ�");
			}
			else{
				System.out.println("//�ļ����ڴ���ʧ��");
			}
			return "regsuccess";
		}
		return "regerror";
	}

	public String loadalluser() {
		List<UsersBean> list = usersDao.getalluser();
		ActionContext actionContext = ActionContext.getContext(); // ȡ��struts����
		Map session = actionContext.getSession(); // ȡ��session
		session.put("USERLIST", list); // ���û����ݷ���session
		return "list";
	}

	public String getuserinfo() {
		UsersBean userinfo = usersDao.getUserByid(user.getUserid());
		ActionContext actionContext = ActionContext.getContext(); // ȡ��struts����
		Map session = actionContext.getSession(); // ȡ��session
		
		session.put("obj", userinfo); // ���û����ݷ���session
		return "userinfo";
	}

	public String editor() {
		System.out.println(user.getUsername());
		usersDao.editoruser(user);
		return "edisusses";
	}

	public String delete() {
		System.out.println(user.getUserid());
		usersDao.deleteuser(user);
		return "edisusses";
	}
	
	public String exit(){
		ActionContext actionContext = ActionContext.getContext(); // ȡ��struts����
		Map session = actionContext.getSession(); // ȡ��session
		session.remove("USER");
		
		return "exit";
	}

}
