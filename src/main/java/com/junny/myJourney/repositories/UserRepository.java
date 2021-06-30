package com.junny.myJourney.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.junny.myJourney.models.User;
@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User findByEmail(String email);
    
 // sort by date DESC
// 	@Query(value = "SELECT * FROM posts ORDER BY created_at DESC", nativeQuery = true)
// 	List<Post> postsDescByDate();
// 	
// 	// sort by date ASC
// 	@Query(value = "SELECT * FROM users ORDER BY created_at ASC", nativeQuery = true)
// 	List<Post> postsAscByDate();
}