package com.personal.geocaching.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.personal.geocaching.models.Geocaching;

public interface GeocachingRepository extends CrudRepository<Geocaching, Long>{
	List<Geocaching> findAll();
//	List<Geocaching> findByUsersIdIs(Long userId);
}
