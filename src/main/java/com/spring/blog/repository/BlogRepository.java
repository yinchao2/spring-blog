package com.spring.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.blog.entity.Blog;

public interface BlogRepository extends JpaRepository<Blog, Integer> {

}
