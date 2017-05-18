package com.niit.ca.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ca.DAO.CategoryDAO;
import com.niit.ca.model.Category;

@Controller
public class CategoryController {

	@Autowired
	CategoryDAO cdao;

	@RequestMapping(value = "/addcategory", method = RequestMethod.POST)
	public ModelAndView insert_category(@Valid @ModelAttribute("Category") Category c) {

		System.out.println("entered category");
		ModelAndView mv = new ModelAndView("category");
		System.out.println("im in");
		mv.addObject("Category", c);
		cdao.insert_category(c);
		System.out.println("inserted");
		mv.addObject("Category", new Category());
		
		return mv;

	}

}
