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
	
<<<<<<< HEAD
//	ThingToBeDonated save(ThingToBeDonated item);
	<S extends ThingToBeDonated> S save(S thingToBeDonate);
	
=======
	<S extends ThingToBeDonated> S save(S thingToBeDonate);
>>>>>>> f2df6336e591af5d38a10d753bceddecfdbf581a

}
