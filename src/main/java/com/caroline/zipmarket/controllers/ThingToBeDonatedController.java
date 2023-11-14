package com.caroline.zipmarket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.caroline.zipmarket.models.ThingToBeDonated;
import com.caroline.zipmarket.services.ThingToBeDonatedService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ThingToBeDonatedController {

	@Autowired
	ThingToBeDonatedService thingToBeDonatedService;
	
//route that serves the template
@GetMapping("/donate")
public String Donate(@ModelAttribute("item")ThingToBeDonated thingToBeDonate) {
	return "create_donation.jsp";
}

//route that sends the information to the DataBase
@PostMapping("/create/donation")
public String CreateDonation(@Valid @ModelAttribute("item")ThingToBeDonated thingToBeDonate,BindingResult result, HttpSession session) {
	if(result.hasErrors()) {
		return "create_donation.jsp";
	}
	thingToBeDonatedService.createDonation(thingToBeDonate);
	return "redirect:/dashboard";
	
}



}
