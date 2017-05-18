package com.niit.ca.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int categoryid;
	
	String categoryname;
	String categorydescriptions;
	
	public int getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public String getCategorydescriptions() {
		return categorydescriptions;
	}
	public void setCategorydescriptions(String categorydescriptions) {
		this.categorydescriptions = categorydescriptions;
	}
	
	
	
}
