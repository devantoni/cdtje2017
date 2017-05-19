package com.niit.ca.DAO;

import org.springframework.stereotype.Service;

import com.niit.ca.model.Category;

@Service
public interface CategoryDAO {

	public String insert_category(Category c);
	public String update_category(Category c);
	public String delete_category(int categoryid);
	public String viewCategory();
	public Category viewOneCategory(int id);

}
