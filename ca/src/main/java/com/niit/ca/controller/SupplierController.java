package com.niit.ca.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ca.DAO.SupplierDAO;
import com.niit.ca.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	SupplierDAO sdao;

	@RequestMapping(value="/supplier")
	public ModelAndView gotosupplier(Supplier s)
	{
		String supplierlist = sdao.viewSupplier();
		
		ModelAndView mv=new ModelAndView("supplier");
		mv.addObject("Supplier", new Supplier());
		mv.addObject("supplierlist", supplierlist);
		mv.addObject("check","true");
		return mv;
	}
	@RequestMapping(value = "/addsupplier", method = RequestMethod.POST)
	public String insert_supplier(@Valid @ModelAttribute("Supplier") Supplier s) {

		System.out.println("entered supplier module");
		ModelAndView mv = new ModelAndView("supplier");
		System.out.println("im in");
		mv.addObject("Supplier", s);
		sdao.insert_supplier(s);
		System.out.println("inserted");
		mv.addObject("Supplier", new Supplier());
		System.out.println("yippee");

		System.out.println("see u at login");
		return "redirect:/supplier";
	}
	@RequestMapping("removingsupplier/{supplierid}")
	public String removesupplier(@PathVariable("supplierid") int supplierid) {
		sdao.delete_supplier(supplierid);
		return "redirect:/supplier";
	}
	@RequestMapping(value="/addsupplier", params="EditSupplier")
	public String editsupplier(@ModelAttribute("Supplier") Supplier sm) {
		sdao.update_supplier(sm);
		return "redirect:/supplier";
	}
	@RequestMapping("/editsupplierbutton")
	public ModelAndView passingonesupplier(@RequestParam("getsid") int supplierid) {
		
		String supplierlist = sdao.viewSupplier();
		ModelAndView mv = new ModelAndView("supplier");
		mv.addObject("Supplier",sdao.viewOneSupplier(supplierid));
		mv.addObject("supplierlist", supplierlist);
		mv.addObject("check","false");
		return mv;
	}
}
