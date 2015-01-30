package com.spring.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.blog.entity.Blog;
import com.spring.blog.entity.User;
import com.spring.blog.repository.BlogRepository;
import com.spring.blog.repository.UserRepository;

@Service
public class BlogService {

	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	public void save(Blog blog, String name) {
		User user = userRepository.findByName(name);
		blog.setUser(user);
		blogRepository.save(blog);
	}

	public void remove(int id) {
		blogRepository.delete(id);
	}

	
}
