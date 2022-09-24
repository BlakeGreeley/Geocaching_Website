package com.personal.geocaching.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.personal.geocaching.models.Geocaching;
import com.personal.geocaching.repositories.GeocachingRepository;


@Service
public class GeocachingService {
	@Autowired
	private GeocachingRepository repo;
	
	public Geocaching findById(Long id) {
		Optional<Geocaching> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
	public List<Geocaching> all() {
		return repo.findAll();
	}
	
	public Geocaching update(Geocaching geocaching) {
		return repo.save(geocaching);
	}
	
	public Geocaching create(Geocaching geocaching) {
		return repo.save(geocaching);
	}
	
	public void delete(Long id) {
		repo.deleteById(id);
	}
}
