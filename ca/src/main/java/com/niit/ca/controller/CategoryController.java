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
		mv.addObject("CategoryObject", new Category());
		mv.addObject("categorylist", categorylist);
		mv.addObject("check","true");
		return mv;
	}
	
	
	@RequestMapping(value = "/addcategory", method = RequestMethod.POST)
	public String insert_category(@Valid @ModelAttribute("CategoryObject") Category c) {

		System.out.println("entered category");
		ModelAndView mv = new ModelAndView("category");
		System.out.println("im in");
		mv.addObject("CategoryObject", c);
		cdao.insert_category(c);
		System.out.println("inserted");
		mv.addObject("CategoryObject", new Category());
		
		return "redirect:/category";

	}
	
	@RequestMapping("removingcategory/{categoryid}")
	public String removecategory(@PathVariable("categoryid") int categoryid) {
		cdao.delete_category(categoryid);
		return "redirect:/category";
	}

	@RequestMapping(value="/addcategory", params="EditCategory")
	public String editcategory(@ModelAttribute("CategoryObject") Category cm) {
		cdao.update_category(cm);
		return "redirect:/category";
	}
	@RequestMapping("/editcategorybutton")
	public ModelAndView passingonecategory(@RequestParam("getcid") int categoryid) {
		
		String categorylist = cdao.viewCategory();
		ModelAndView mv = new ModelAndView("category");
		mv.addObject("CategoryObject",cdao.viewOneCategory(categoryid));
		System.out.println("inside here?");
		mv.addObject("categorylist", categorylist);
		mv.addObject("check","false");
		return mv;
	}

}
