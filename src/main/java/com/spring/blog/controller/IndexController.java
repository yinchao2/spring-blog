package com.spring.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public String indexController() {
		return "/WEB-INF/jsp/index.jsp";
	}
}
