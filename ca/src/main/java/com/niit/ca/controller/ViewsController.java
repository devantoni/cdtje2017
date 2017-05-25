package com.niit.ca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ca.model.User;

@Controller
public class ViewsController {

	@RequestMapping(value={"/","","/home"})
	public String gotoindex()
	{
		return "index";
	}
	@RequestMapping(value="/about")
	public String gotoabout()
	{
		return "about";
	}
	@RequestMapping(value="/contact")
	public String gotocontact()
	{
		return "contact";
	}
	
	
	@RequestMapping(value="/register")
	public ModelAndView gotoregister(User u)
	{
		ModelAndView mv=new ModelAndView("register");
		mv.addObject("User", new User());
		return mv;
	}
	
	
	
	
	
}
