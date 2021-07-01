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
	
	// personal = 1 = private; personal = 0 = public
	@Query(value = "SELECT * FROM posts WHERE personal=0", nativeQuery = true)
	List<Post> findAllPublicPosts();
	
//	// get one user's posts that contains the searched string in title or text
//	@Query(value="SELECT * FROM posts WHERE user_id = ?1 AND (text LIKE %?2% OR text LIKE %?3 OR text LIKE ?4%)")
//	List<Post> findOneUsersPostsBySearchOnText(Long id, String searc1h, String search2, String search3);
//	
//	@Query(value="SELECT * FROM posts WHERE user_id = ?1 AND (title LIKE %?2% OR title LIKE %?3 OR title LIKE ?4%)")
//	List<Post> findOneUsersPostsBySearchOnTitle(Long id, String searc1h, String search2, String search3);
}