package com.spring.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.blog.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

}
