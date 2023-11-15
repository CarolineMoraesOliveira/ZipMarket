package com.caroline.zipmarket.controllers;

<<<<<<< HEAD
>>>>>>> 1fbf8d453276e2377ed0e9ba075de9413777a137
=======
>>>>>>> 1fbf8d453276e2377ed0e9ba075de9413777a137
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.caroline.zipmarket.models.LoginUser;
import com.caroline.zipmarket.models.ThingToBeDonated;
import com.caroline.zipmarket.models.User;
import com.caroline.zipmarket.services.ThingToBeDonatedService;
import com.caroline.zipmarket.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;



@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ThingToBeDonatedService thingToBeDonatedService;
	
	
	
//	LANDING PAGE WHERE EVERYTHING STARTS!!!
	
	@GetMapping("/zipmarket")
	public String landingpage() {
		return "landpage.jsp";
	}
	
	
	
	 // ROUTE TO THE LOGIN PAGE
	
	@GetMapping("/")
	    public String index(@ModelAttribute ("newUser") User newUser, Model model,
	    					@ModelAttribute ("newLogin") User newLogin) { 
	       
			return "login.jsp";
	    }
	
// POST ROUTE AFTER REGISTER THE USER
	
	@PostMapping("/register")
	    public String register (@Valid @ModelAttribute("newUser") User newUser, 
	            BindingResult result, Model model, HttpSession session) { 
	        
	       userService.register(newUser,result); 
	        
	        if(result.hasErrors()) {
	          
	            model.addAttribute("newLogin", new LoginUser()); 
	            return "login.jsp";
	        }
	        else {
	        
	        	session.setAttribute("userId", newUser.getId()); 
	        	model.addAttribute("newUser", newUser);
	        	
	    
	        return "redirect:/dashboard";
	        }
	 }
	 
	// ROUTE TO THE DASHBOARD PAGE
	
	 @GetMapping ("/dashboard")
	 	public String dashboardPage (Model model, HttpSession session) { 
	 	
		 Long userId = (Long) session.getAttribute("userId"); 
		 
		 if (userId == null) {

			 return "redirect:/";
		 }
	 	
		 User user = userService.findById(userId);  
		 model.addAttribute("newUser", user);
		 List <User> allUsers = userService.findAll();
		 model.addAttribute("users", allUsers); 


		 List<ThingToBeDonated> item = thingToBeDonatedService.allDonations();

		    for (ThingToBeDonated items : item) {
		        items.getBase64Image(); 
		    }
				 model.addAttribute("item", item);

		 	return "dashboard.jsp";
	 }
	 
	 // POST ROUTE AFTER LOGIN
	 
	 @PostMapping("/login")
	    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	            BindingResult result, Model model, HttpSession session) {
	    
	        
	         User user = userService.login(newLogin, result);  
	    
	        if(result.hasErrors()) { 
	        	
	            model.addAttribute("newUser", new User());
	            return "login.jsp"; 
	        }
	        else {
	        	session.setAttribute("userId", user.getId()); 
	        	model.addAttribute("newUser", user);
	        
	    
	        return "redirect:/dashboard";
	        }

	 
	 // POS ROUTE TO UPDATE THE PAGE WITH THE IMAGES RELATED TO THE USER THAT LIVES ON THE SELECTED ZIPCODE

	 } 
	 
	 
	 
//		LOGOUT JR
		@GetMapping("/logout")
		public String logout(HttpSession session) {
			session.invalidate();
			return "redirect:/";
		}
	

	 
	 @PostMapping ("/{zipCode}/show")
	 	public String processFormSelectedZipCode (@Valid @ModelAttribute("newUser") User newUser, 
	 			BindingResult result, Model model, HttpSession session, @PathVariable String zipCode) { {
		 
	 		 if(result.hasErrors()) { 
	 		 return "dashboard.jsp"; 
	 		 }
	 	     List<User> usersByZipCode = userService.findAllByZipCode(zipCode);
	 	     model.addAttribute("usersByZipCode", usersByZipCode);
	 	     return "dashboard";
	 		 }
	 	}	 
	 }



