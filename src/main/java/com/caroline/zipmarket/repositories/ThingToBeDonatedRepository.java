package com.caroline.zipmarket.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.caroline.zipmarket.models.ThingToBeDonated;

@Repository
public interface ThingToBeDonatedRepository extends CrudRepository<ThingToBeDonated, Long> {
	
	List<ThingToBeDonated> findAll();
	
	Optional<ThingToBeDonated> findById(long id);
	
//	ThingToBeDonated save(ThingToBeDonated item);
	<S extends ThingToBeDonated> S save(S thingToBeDonate);
	

}
