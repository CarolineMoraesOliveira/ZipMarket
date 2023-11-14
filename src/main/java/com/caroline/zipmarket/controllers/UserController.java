package com.caroline.zipmarket.controllers;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		 	
		 //render the items info
//		 List<ThingToBeDonated> item = thingToBeDonatedService.allDonations();
//		 for (ThingToBeDonated thing : item) {   
//			    String base64Image = Base64.getEncoder().encodeToString(thing.getArticleImage());
//			    thing.setBase64Image(base64Image); 
//			}
		 List<ThingToBeDonated> item = thingToBeDonatedService.allDonations();

		    for (ThingToBeDonated items : item) {
		        items.getBase64Image(); // Assuming you have a method like getBase64Image() in your ThingToBeDonated class
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

	 } 
	
	 
}


