package com.niit.ca.DAOImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.niit.ca.DAO.CategoryDAO;
import com.niit.ca.model.Category;
import com.niit.ca.model.Product;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	SessionFactory sessionfactory;
	
	@Override
	public String insert_category(Category c) {
		// TODO Auto-generated method stub
		Session s= sessionfactory.openSession();
		Transaction t=s.getTransaction();
		t.begin();
		s.save(c);
		t.commit();
		s.close();
		return null;

	}

	

	@Override
	public String update_category(Category cm) {
		// TODO Auto-generated method stub
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		s.update(cm);
		t.commit();
		s.close();
		return null;

	}

	@Override
	public String delete_category(int categoryid) {
		System.out.println(categoryid);
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		Category c =  (Category)s.get(Category.class, categoryid);
		s.delete(c);
		t.commit();
		s.close();
		return null;

	}



	@Override
	public String viewCategory() {
		// TODO Auto-generated method stub
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		List<Category> categorylist = s.createQuery("from Category").list();
		Gson g = new Gson();
		String categorylistgson = g.toJson(categorylist);
		t.commit();
		s.close();
		return categorylistgson;
	}

	@Override
	public Category viewOneCategory(int id) {
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		Category cm =  (Category)s.get(Category.class, id);
		t.commit();
		s.close();
		return cm;
	}

}
