package com.niit.ca.DAOImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.niit.ca.DAO.ProductDAO;
import com.niit.ca.model.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	SessionFactory sessionfactory;

	@Override
	public String insert_product(Product p) {
		// TODO Auto-generated method stub
		Session s= sessionfactory.openSession();
		Transaction t=s.getTransaction();
		t.begin();
		s.save(p);
		t.commit();
		s.close();
		return null;

		// TODO Auto-generated method stub

	}


	

	@Override
	public String viewProduct() {
		// TODO Auto-generated method stub
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		List<Product> productslist = s.createQuery("from Product").list();
		Gson g = new Gson();
		String productslistgson = g.toJson(productslist);
		t.commit();
		s.close();
		return productslistgson;
		
	}




	@Override
	public String updateProduct(int productid, Product p) {
		// TODO Auto-generated method stub
		System.out.println(p.getProductid());
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		Product oneproductobject = (Product)s.get(Product.class,productid);
		oneproductobject.setCategoryId(p.getCategoryId());
		oneproductobject.setSupplierId(p.getSupplierId());
		oneproductobject.setProductdescription(p.getProductdescription());
		oneproductobject.setProductname(p.getProductname());
		oneproductobject.setProductprice(p.getProductprice());
		oneproductobject.setProductinv(p.getProductinv());
		s.update(oneproductobject);
		t.commit();
		s.close();
		return null;
	}




	@Override
	public String deleteProduct(int productid) {
		// TODO Auto-generated method stub
		System.out.println(productid);
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		Product p =  (Product)s.get(Product.class, productid);
		s.delete(p);
		t.commit();
		s.close();
		return null;
	}




	@Override
	public Product viewOneProduct(int pid) {
		// TODO Auto-generated method stub
		Session s = sessionfactory.openSession();
		Transaction t = s.getTransaction();
		t.begin();
		Product pm =  (Product)s.get(Product.class, pid);
		t.commit();
		s.close();
		return pm;
	}

}
