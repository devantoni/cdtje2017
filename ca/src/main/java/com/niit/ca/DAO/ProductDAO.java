package com.niit.ca.DAO;

import org.springframework.stereotype.Service;


import com.niit.ca.model.Product;
@Service
public interface ProductDAO {
	public String insert_product(Product p);
	public String viewProduct();
	public String updateProduct(int productid ,Product p);
	public String deleteProduct(int productid);
	public Product viewOneProduct(int pid);
}
