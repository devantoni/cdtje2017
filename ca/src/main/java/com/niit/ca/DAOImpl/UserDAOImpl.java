package com.niit.ca.DAOImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.ca.DAO.UserDAO;
import com.niit.ca.model.User;

@Repository

public class UserDAOImpl implements UserDAO {
	@Autowired
	SessionFactory sessionfactory;
	@Override
	public String insert_user(User u) {
		// TODO Auto-generated method stub
		Session s= sessionfactory.openSession();
		Transaction t=s.getTransaction();
		t.begin();
		s.save(u);
		t.commit();
		s.close();
		return null;

	}

	@Override
	public String read_user(User userid) {
		return null;
		// TODO Auto-generated method stub
		
	}

	@Override
	public String update_user(User userid) {
		return null;
		// TODO Auto-generated method stub
		
	}

	@Override
	public String delete_user(User userid) {
		return null;
		// TODO Auto-generated method stub
		
	}

	@Override
	public String readsingle_user(User userid) {
		return null;
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> ListUser() {
		// TODO Auto-generated method stub
		List<User> list = sessionfactory.getCurrentSession().createQuery("from User u").list();
		return list;
	}

}
