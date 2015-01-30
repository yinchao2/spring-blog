package com.spring.blog.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.blog.entity.Blog;
import com.spring.blog.entity.User;
import com.spring.blog.service.BlogService;
import com.spring.blog.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BlogService blogService;
	
	@ModelAttribute
	public Blog constructBlog() {
		return new Blog();
	}
	
	@RequestMapping("/users")
	public String users(Model model) {
		model.addAttribute("users", userService.findAll());
		return "users";
	}
	
	@RequestMapping("/users/{id}")
	public String detail(Model model, @PathVariable int id) {
		model.addAttribute("user", userService.findOneWithBlogs(id));
		return "user-detail";
	}
	
	@RequestMapping("/register")
	public String showRegister(Model model) {
		model.addAttribute("user", new User());
		return "user-register";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String doRegister(@ModelAttribute User user) {
		userService.save(user);
		return "redirect:/register.html?success=true";
	}
	
	@RequestMapping("/account")
	public String account(Model model, Principal principal) {
		String name = principal.getName();
		model.addAttribute("user", userService.findOneWithBlogs(name));
		return "user-detail";
	}
	
	@RequestMapping(value="/account", method=RequestMethod.POST)
	public String doCreateBlog(@ModelAttribute Blog blog,  Principal principal) {
		String name = principal.getName();
		blogService.save(blog, name);
		return "redirect:/account.html";
	}
	
	@RequestMapping(value="/blog/remove/{id}")
	public String removeBlog(@PathVariable int id) {
		blogService.remove(id);
		return "redirect:/account.html";
	}
	
	@RequestMapping(value="/user/remove/{id}")
	public String removeUser(@PathVariable int id) {
		userService.remove(id);
		return "redirect:/users.html";
	}
	
	
	
}
