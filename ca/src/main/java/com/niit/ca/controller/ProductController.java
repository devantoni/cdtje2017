package com.niit.ca.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.niit.ca.DAO.CategoryDAO;
import com.niit.ca.DAO.ProductDAO;
import com.niit.ca.DAO.SupplierDAO;
import com.niit.ca.model.Product;

@Controller
public class ProductController {

	@Autowired
	ProductDAO prdao;

	@Autowired
	CategoryDAO cdao;

	@Autowired
	SupplierDAO sdao;

	@RequestMapping(value = "/product")
	public ModelAndView gotoproduct() {
		String productlist = prdao.viewProduct();
		String categorylist = cdao.viewCategory();
		String supplierlist = sdao.viewSupplier();

		ModelAndView mv = new ModelAndView("product");
		mv.addObject("ProductObject", new Product());
		mv.addObject("productlist", productlist);
		mv.addObject("supplierslist", supplierlist);
		mv.addObject("categorylist", categorylist);
		mv.addObject("check", "true");
		return mv;
	}

	@RequestMapping(value = "/addproduct", params="Add")
	public String insert_product(@Valid @ModelAttribute("ProductObject") Product p) {
		prdao.insert_product(p);
		System.out.println("im in");
		String path = "D:\\workspace\\ca\\src\\main\\webapp\\resources\\Pimage\\";
		path = path + String.valueOf(p.getProductid()) + "" + ".jpg";
		MultipartFile filedet = p.getPImage();
		if (!filedet.isEmpty()) {
			try {
				byte[] bytes = filedet.getBytes();
				System.out.println(bytes.length);
				FileOutputStream fos = new FileOutputStream(new File(path));
				BufferedOutputStream bs = new BufferedOutputStream(fos);
				bs.write(bytes);
				bs.close();	fos.close();
				Thread.sleep(10000);
				System.out.println("File Uploaded Successfully");
			} catch (Exception e) {
				System.out.println("Exception Arised" + e);
			}	} else {
			System.out.println("File is Empty not Uploaded");
		}
		return "redirect:/product";
	}
	
	@RequestMapping(value = "/editingproduct")
	public ModelAndView gotoeditproduct(@RequestParam("getpid") int productid) {
		String productlist = prdao.viewProduct();
		String categorylist = cdao.viewCategory();
		String supplierlist = sdao.viewSupplier();

		ModelAndView mv = new ModelAndView("product");
		mv.addObject("ProductObject", prdao.viewOneProduct(productid));
		mv.addObject("productlist", productlist);
		mv.addObject("supplierslist", supplierlist);
		mv.addObject("categorylist", categorylist);
		mv.addObject("check", "false");
		return mv;
	}
	
	
	@RequestMapping(value = "/addproduct", params="Edit")
	public String update_product(@ModelAttribute("ProductObject") Product p) {
		System.out.println("inside update"+p.getProductid());
		prdao.updateProduct(p.getProductid(), p);
		String path = "D:\\workspace\\ca\\src\\main\\webapp\\resources\\Pimage\\";
		path = path + String.valueOf(p.getProductid()) + "" + ".jpg";
		MultipartFile filedet = p.getPImage();
		if (!filedet.isEmpty()) {
			try {
				byte[] bytes = filedet.getBytes();
				System.out.println(bytes.length);
				File f = new File(path);
				if (f.exists()) 
				{
					f.delete();
					FileOutputStream fos = new FileOutputStream(f);
					BufferedOutputStream bs = new BufferedOutputStream(fos);
					bs.write(bytes);
					bs.close();
					fos.close();
					Thread.sleep(10000);
					System.out.println("File Uploaded Successfully");
				}
			} catch (Exception e) {
				System.out.println("Exception Arised" + e);
			}
		} else {
			System.out.println("File is Empty not Uploaded");
		}
		return "redirect:/product";
	}

	@RequestMapping("/showproductpage")
	public ModelAndView allprod() {
		String productlist = prdao.viewProduct();
		ModelAndView mv = new ModelAndView("allproducts");
		mv.addObject("ProductObject", new Product());
		mv.addObject("productlist", productlist);
		mv.addObject("check", "true");
		return mv;
	}
	
	@RequestMapping("removingproduct/{productid}")
	public String removeproduct(@PathVariable("productid") int productid) {
		prdao.deleteProduct(productid);
		return "redirect:/product";
	}
	
	@RequestMapping("/viewproduct")
	public ModelAndView viewproductdata(@RequestParam("getId") int productid,HttpSession session) {
		Gson g = new Gson();
		String productdata = g.toJson(prdao.viewOneProduct(productid));
		//session.setAttribute("productid", productid);
		ModelAndView mv = new ModelAndView("singleprod");
		mv.addObject("pro", productdata);
		return mv;
	}
}
