package com.spring.blog.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.blog.entity.Blog;
import com.spring.blog.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer> {

	List<Blog> findByUser(User user);

}
