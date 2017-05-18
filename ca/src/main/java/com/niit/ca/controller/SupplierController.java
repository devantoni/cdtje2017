package com.niit.ca.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ca.DAO.SupplierDAO;
import com.niit.ca.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	SupplierDAO sdao;

	@RequestMapping(value = "/addsupplier", method = RequestMethod.POST)
	public ModelAndView insert_supplier(@Valid @ModelAttribute("Supplier") Supplier s) {

		System.out.println("entered supplier module");
		ModelAndView mv = new ModelAndView("supplier");
		System.out.println("im in");
		mv.addObject("Supplier", s);
		sdao.insert_supplier(s);
		System.out.println("inserted");
		mv.addObject("Supplier", new Supplier());
		System.out.println("yippee");

		System.out.println("see u at login");
		return mv;

	}
}
