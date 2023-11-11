package com.caroline.zipmarket.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.caroline.zipmarket.models.User;

@Repository
public interface UserRepository extends CrudRepository <User, Long>{

		
		Optional <User> findByEmail(String email);
		
		Optional<User> findById(Long id);
	}
