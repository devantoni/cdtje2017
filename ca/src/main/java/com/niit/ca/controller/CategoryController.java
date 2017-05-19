package com.niit.ca.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ca.DAO.CategoryDAO;
import com.niit.ca.model.Category;

@Controller
public class CategoryController {

	@Autowired
	CategoryDAO cdao;

	@RequestMapping(value="/category")
	public ModelAndView gotocategory(Category c)
	{String categorylist = cdao.viewCategory();
	
		ModelAndView mv=new ModelAndView("category");
		mv.addObject("Category", new Category());
		mv.addObject("categorylist", categorylist);
		mv.addObject("check","true");
		return mv;
	}
	
	
	@RequestMapping(value = "/addcategory", method = RequestMethod.POST)
	public String insert_category(@Valid @ModelAttribute("Category") Category c) {

		System.out.println("entered category");
		ModelAndView mv = new ModelAndView("category");
		System.out.println("im in");
		mv.addObject("Category", c);
		cdao.insert_category(c);
		System.out.println("inserted");
		mv.addObject("Category", new Category());
		
		return "redirect:/category";

	}
	
	@RequestMapping("removingcategory/{categoryid}")
	public String removecategory(@PathVariable("categoryid") int categoryid) {
		cdao.delete_category(categoryid);
		return "redirect:/category";
	}

}
