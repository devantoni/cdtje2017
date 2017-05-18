package com.niit.ca.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int productid;
	
	String productname;

	String productdescription;
	
	String productsku; // stock unit code
	String productinv; // inventory
	String productprice;
	String CategoryId;
	String SupplierId;
	@Transient
	MultipartFile PImage;
	
	public MultipartFile getPImage() {
		return PImage;
	}
	public void setPImage(MultipartFile pImage) {
		PImage = pImage;
	}
	public String getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(String categoryid) {
		this.CategoryId = categoryid;
	}
	public String getSupplierId() {
		return SupplierId;
	}
	public void setSupplierId(String supplierid) {
		this.SupplierId = supplierid;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getProductdescription() {
		return productdescription;
	}
	public void setProductdescription(String productdescription) {
		this.productdescription = productdescription;
	}
	public String getProductsku() {
		return productsku;
	}
	public void setProductsku(String productsku) {
		this.productsku = productsku;
	}
	public String getProductinv() {
		return productinv;
	}
	public void setProductinv(String productinv) {
		this.productinv = productinv;
	}
	public String getProductprice() {
		return productprice;
	}
	public void setProductprice(String productprice) {
		this.productprice = productprice;
	}
}
