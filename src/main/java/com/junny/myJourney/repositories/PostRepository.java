package com.junny.myJourney.repositories;

import java.util.List;
import org.springframework.data.repository.CrudRepository; // gives us access to a bunch of functionalities from the DB
import org.springframework.stereotype.Repository;

import com.junny.myJourney.models.Post;

@Repository
public interface PostRepository extends CrudRepository<Post, Long>{
	List<Post> findAll();
}