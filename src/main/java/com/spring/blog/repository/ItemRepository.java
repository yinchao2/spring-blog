package com.spring.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.blog.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {

}
