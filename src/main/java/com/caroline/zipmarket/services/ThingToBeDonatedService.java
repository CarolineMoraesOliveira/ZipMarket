package com.caroline.zipmarket.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caroline.zipmarket.models.ThingToBeDonated;
import com.caroline.zipmarket.repositories.ThingToBeDonatedRepository;

@Service
public class ThingToBeDonatedService {
	
	@Autowired
	private ThingToBeDonatedRepository thingToBeDonatedRepository;
	
	public List<ThingToBeDonated> allDonations(){
		return thingToBeDonatedRepository.findAll();
	}
	

	public ThingToBeDonated createDonation(ThingToBeDonated thingToBeDonate) {
		return thingToBeDonatedRepository.save(thingToBeDonate);
	}
	
	public ThingToBeDonated findDonation(Long id) {
		Optional<ThingToBeDonated> optionalItem = thingToBeDonatedRepository.findById(id);
		if(optionalItem.isPresent()) {
    		return optionalItem.get();
    	}else {
    		return null;
    	}
	}
	
	public ThingToBeDonated updateItem(ThingToBeDonated thingToBeDonate) {
		return thingToBeDonatedRepository.save(thingToBeDonate);
	}
	
	public void deleteItem(Long id) {
		if(thingToBeDonatedRepository.findById(id)!= null)
			thingToBeDonatedRepository.deleteById(id);
	}
	
	

}
