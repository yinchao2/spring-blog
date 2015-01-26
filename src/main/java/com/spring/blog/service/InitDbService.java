package com.spring.blog.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.blog.entity.Blog;
import com.spring.blog.entity.Item;
import com.spring.blog.entity.Role;
import com.spring.blog.entity.User;
import com.spring.blog.repository.BlogRepository;
import com.spring.blog.repository.ItemRepository;
import com.spring.blog.repository.RoleRepository;
import com.spring.blog.repository.UserRepository;

@Transactional
@Service
public class InitDbService {
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@PostConstruct
	public void init() {
		Role roleUser = new Role();
		roleUser.setName("ROLE_USER");
		roleRepository.save(roleUser);
		
		Role roleAdmin = new Role();
		roleAdmin.setName("ROLE_ADMIN");
		roleRepository.save(roleAdmin);
		
		User userAdmin = new User();
		userAdmin.setName("admin");
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleUser);
		roles.add(roleAdmin);
		userAdmin.setRoles(roles);
		userRepository.save(userAdmin);
		
		Blog blogJavavids = new Blog();
		blogJavavids.setName("Javavids");
		blogJavavids.setUrl("www.javavids.com");
		blogJavavids.setUser(userAdmin);
		blogRepository.save(blogJavavids);
		
		Item item1 = new Item();
		item1.setTitle("First item");
		item1.setLink("http://www.javaids.com");
		item1.setPublishedDate(new Date());
		itemRepository.save(item1);
		
		Item item2 = new Item();
		item2.setTitle("Second item");
		item2.setLink("http://www.javaids.com");
		item2.setPublishedDate(new Date());
		itemRepository.save(item2);
		
	}
	

}
