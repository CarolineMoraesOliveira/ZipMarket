package com.caroline.zipmarket.services;

import java.util.List;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.caroline.zipmarket.models.LoginUser;
import com.caroline.zipmarket.models.User;
import com.caroline.zipmarket.repositories.UserRepository;


@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	    
    public User register(User newUser, BindingResult result) { 
    	
    	Optional <User> userIsTryingToLog = userRepository.findByEmail(newUser.getEmail()); 
    	if (userIsTryingToLog.isPresent()) { 
    		
    		result.rejectValue("email", "Matches", "This user email already exists"); 
    	}
    	
    	if(!newUser.getPassword().equals(newUser.getConfirm())) { 
    	    
    		result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
    	
    	if (result.hasErrors()) { 
    		
    		return null;
    	}
    		
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());  
    	newUser.setPassword(hashed); 
    	
    	return userRepository.save(newUser); 
    	
    }
    
    public User findById(Long id) {
    	Optional <User> userIsTryingToLog = userRepository.findById(id); 
    		if (userIsTryingToLog.isPresent()) { 
    			return userIsTryingToLog.get();
    		}
    		return null; 
    }
   
    
    
    public User login(LoginUser newLoginObject, BindingResult result) {
    	
    	Optional <User> userIsTryingToLog = userRepository.findByEmail(newLoginObject.getEmail());
    	 
    
    	if (!userIsTryingToLog.isPresent()) {  
    		
    		result.rejectValue("email", "Matches", "This user is not found");  
    		
    		return null;
    	}
    		
    		User user = userIsTryingToLog.get(); 
    	
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	     
    	}
    	
    	if (result.hasErrors()) {
    		
    		return null;  
    	}
    	
    	else {
    		return user;  
    	}
    	
    }

	public List<User> findAll() {
		
		return userRepository.findAll();
	}
}
