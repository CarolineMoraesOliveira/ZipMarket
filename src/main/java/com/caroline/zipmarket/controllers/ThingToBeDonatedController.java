package com.caroline.zipmarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.caroline.zipmarket.models.ThingToBeDonated;
import com.caroline.zipmarket.models.User;
import com.caroline.zipmarket.services.ThingToBeDonatedService;
import com.caroline.zipmarket.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ThingToBeDonatedController {

	@Autowired
	private ThingToBeDonatedService thingToBeDonatedService;
	
	@Autowired
	private UserService userService;
	

	//route that serves the template
	@GetMapping("/donate")
	public String Donate1(@ModelAttribute("item")ThingToBeDonated thingToBeDonate) {
		return "create_donation.jsp";
	}


	
//route that serves the form template
//@GetMapping("/donate")
//public String Donate(@ModelAttribute("item")ThingToBeDonated thingToBeDonate) {
//	return "create_donation.jsp";
//}

//route that sends the information to the DataBase
@PostMapping("/create/donation")
public String CreateDonation(@Valid @ModelAttribute("item")ThingToBeDonated thingToBeDonate,BindingResult result, HttpSession session) {
	if(result.hasErrors()) {
		return "create_donation.jsp";

    
	}
	Long id = (Long) session.getAttribute("userId");
	User user = userService.findById(id);
	thingToBeDonate.setPersonWhoIsGoingToDonate(user);
	thingToBeDonatedService.createDonation(thingToBeDonate);
	return "redirect:/dashboard";
}
  

//serves the view template
@GetMapping("/view/{donationId}")
public String view(@ModelAttribute("item")ThingToBeDonated thingToBeDonate, @PathVariable("donationId") Long donationId, Model model, HttpSession session) {
	ThingToBeDonated item = thingToBeDonatedService.findDonation(donationId);
	System.out.println(donationId);
	model.addAttribute("item" ,item);
		
	User user = userService.findById(donationId);
	model.addAttribute("user",user);
	return "view_article.jsp";
}

//route serves the template to update
@GetMapping("/donation/{id}/edit")
public String edit(@PathVariable("id")Long id, Model model) {
	ThingToBeDonated thingToBeDonate = thingToBeDonatedService.findDonation(id);
	model.addAttribute("thingToBeDonate",thingToBeDonate);
	return "edit.jsp";
}

//edit donation item in DB
@RequestMapping(value="/donation/{id}",method=RequestMethod.PUT )
public String edit(@Valid @ModelAttribute("item")ThingToBeDonated thingToBeDonate,BindingResult result, HttpSession session, Model model) {
	if(result.hasErrors()) {
		model.addAttribute("item", thingToBeDonate);
		return "edit_donation.jsp";
	}
	thingToBeDonatedService.updateItem(thingToBeDonate);
	return "redirect:/dashboard";
	
}

//delete item
@GetMapping("/donation/delete/{id}")
public String delete(@PathVariable("id")Long id) {
	thingToBeDonatedService.deleteItem(id);
	return "redirect:/dashboard";
}

//view user details
@GetMapping("/view/user/{id}")
public String view_user_details(Model model, @PathVariable("id")Long id) { 
 	
	ThingToBeDonated item = thingToBeDonatedService.findDonation(id);
	model.addAttribute("item" ,item);
	
		 User user = userService.findById(id);
		model.addAttribute("user",user);
		 
	return "view_user.jsp";


}
}





