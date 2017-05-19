package com.niit.ca.DAO;

import org.springframework.stereotype.Service;

import com.niit.ca.model.Category;
import com.niit.ca.model.Supplier;

@Service
public interface SupplierDAO {
	public String insert_supplier(Supplier s);

	public String update_supplier(Supplier supplierid);

	public String delete_supplier(int supplierid);

	public String viewSupplier();

	public Category viewOneCategory(int id);

}
