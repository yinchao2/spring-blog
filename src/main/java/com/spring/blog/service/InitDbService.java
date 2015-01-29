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
		item1.setBlog(blogJavavids);
		item1.setTitle("First item");
		item1.setLink("http://www.javaids.com");
		item1.setPublishedDate(new Date());
		itemRepository.save(item1);
		
		Item item2 = new Item();
		item2.setBlog(blogJavavids);
		item2.setTitle("Second item");
		item2.setLink("http://www.javaids.com");
		item2.setPublishedDate(new Date());
		itemRepository.save(item2);
		
		Item item3 = new Item();
		item3.setBlog(blogJavavids);
		item3.setTitle("3 item");
		item3.setLink("http://www.javaids.com");
		item3.setPublishedDate(new Date());
		itemRepository.save(item3);
		
		Item item4 = new Item();
		item4.setBlog(blogJavavids);
		item4.setTitle("4 item");
		item4.setLink("http://www.javaids.com");
		item4.setPublishedDate(new Date());
		itemRepository.save(item4);
		
		Item item5 = new Item();
		item5.setBlog(blogJavavids);
		item5.setTitle("5 item");
		item5.setLink("http://www.javaids.com");
		item5.setPublishedDate(new Date());
		itemRepository.save(item5);
		
		Item item6 = new Item();
		item6.setBlog(blogJavavids);
		item6.setTitle("6 item");
		item6.setLink("http://www.javaids.com");
		item6.setPublishedDate(new Date());
		itemRepository.save(item6);
		
	}
	

}
