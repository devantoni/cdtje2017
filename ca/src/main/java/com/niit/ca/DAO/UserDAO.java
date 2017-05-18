package com.niit.ca.DAO;


import org.springframework.stereotype.Service;

import com.niit.ca.model.User;

@Service
public interface UserDAO {

	public String insert_user(User u);
	public String read_user(User u);
	public String readsingle_user(User u);
	public String update_user(User u);
	public String delete_user(User u);
	
}