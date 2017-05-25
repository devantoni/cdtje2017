package com.niit.ca.DAOImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.niit.ca.DAO.SupplierDAO;
import com.niit.ca.model.Supplier;

@Repository
public class SupplierDAOImpl implements SupplierDAO {
	@Autowired
	SessionFactory sessionfactory;
	@Override
	public String insert_supplier(Supplier s) {
		
		// TODO Auto-generated method stub
		Session ses= sessionfactory.openSession();
		Transaction t=ses.getTransaction();
		t.begin();
		ses.save(s);
		t.commit();
		ses.close();
		return null;

		
	}

	
	@Override
	public String update_supplier(Supplier sm) {
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		s.update(sm);
		t.commit();
		s.close();
		return null;
		
	}

	@Override
	public String delete_supplier(int supplierid) {
		// TODO Auto-generated method stub
		System.out.println(supplierid);
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		Supplier c =  s.get(Supplier.class, supplierid);
		s.delete(c);
		t.commit();
		s.close();
		return null;
		
	}

	@Override
	public String viewSupplier() {
		// TODO Auto-generated method stub
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		List<Supplier> supplierlist = s.createQuery("from Supplier").list();
		Gson g = new Gson();
		String supplierlistgson = g.toJson(supplierlist);
		t.commit();
		s.close();
		return supplierlistgson;
	}

	@Override
	public Supplier viewOneSupplier(int id) {
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		Supplier sm =  s.get(Supplier.class, id);
		t.commit();
		s.close();
		return sm;
	}

}
