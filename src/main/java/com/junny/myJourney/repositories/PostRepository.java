package com.junny.myJourney.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository; // gives us access to a bunch of functionalities from the DB
import org.springframework.stereotype.Repository;

import com.junny.myJourney.models.Post;

@Repository
public interface PostRepository extends CrudRepository<Post, Long>{
	List<Post> findAll();
	List<Post> findByTitleContaining(String search);
	List<Post> findByTextContaining(String search);
	
	// sort by date DESC
	@Query(value = "SELECT * FROM posts ORDER BY created_at DESC", nativeQuery = true)
	List<Post> postsDescByDate();
	
	// sort by date ASC
	@Query(value = "SELECT * FROM posts ORDER BY created_at ASC", nativeQuery = true)
	List<Post> postsAscByDate();
}