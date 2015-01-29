package com.spring.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.blog.entity.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	User findByName(String name);

}
