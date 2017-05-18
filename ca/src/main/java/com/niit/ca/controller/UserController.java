package com.niit.ca.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ca.DAO.UserDAO;
import com.niit.ca.model.User;

@Controller
public class UserController {

	@Autowired
	UserDAO udao;

	@RequestMapping(value = "/adduser", method = RequestMethod.POST)
	public ModelAndView insert_user(@Valid @ModelAttribute("User") User u) {
		System.out.println("entered user module");
		ModelAndView mv = new ModelAndView("login");
		System.out.println("im going to start comparing passwords");
			if (u.getPassword().equals(u.getCpassword())) {
				System.out.println("im in");
				mv.addObject("User", u);
				udao.insert_user(u);
				System.out.println("inserted");
				mv.addObject("User", new User());
				System.out.println("yippee");
			} else {
				System.out.println("Password did not match");
			}
			System.out.println("see u at login");
		return mv;
	}
}
