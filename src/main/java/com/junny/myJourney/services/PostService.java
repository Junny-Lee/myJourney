package com.junny.myJourney.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.junny.myJourney.models.Post;
import com.junny.myJourney.repositories.PostRepository;

@Service
public class PostService {
	 // adding the post repository as a dependency
	 private final PostRepository postRepository;
	 
	 public PostService(PostRepository postRepository) {
	     this.postRepository = postRepository;
	 }
	 // returns all the posts
	 public List<Post> allPosts() {
	     return postRepository.findAll(); // https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#reference 
	 }
	 
	 // created this one for search!
	 public List<Post> allMatchedPosts(String search){
		 List<Post> matchedPosts = postRepository.findByTitleContaining(search);
		 List<Post> matchedPostsInText = postRepository.findByTextContaining(search);
//		 for (int i = 0; i <matchedPostsInText.size(); i++) {
//			 if (!matchedPosts.inArray(matchedPostsInText.get(i))) {
//				 
//			 }
//		 }
		 matchedPosts.addAll(matchedPostsInText);
		 return matchedPosts;
//		 return postRepository.findByTitleContaining(search);
	 }
	 
	 // created this one for DESC
	 public List<Post> allPostsDesc(){
		 return postRepository.postsDescByDate();
	 }
	 
	// created this one for ASC
		 public List<Post> allPostsAsc(){
			 return postRepository.postsAscByDate();
		 }
	 
	 // creates a post
	 public Post createPost(Post n) {
	     return postRepository.save(n); // save() fn from extending from Crud
	 }
	 // retrieves a post
	 public Post findPost(Long id) {
	     Optional<Post> optionalPost = postRepository.findById(id); // Optional is saying "if it is here, i'll get you the post"
	     if(optionalPost.isPresent()) {
	         return optionalPost.get();
	     } else {
	         return null;
	     }
	 }
	 // updates a post
	 public Post updatePost(Long id, String title, String text) {
	 	Post post = findPost(id);
	 	post.setTitle(title);
//	 	post.setDate(date);
	 	post.setText(text);
	 	return postRepository.save(post);
	 }
	 
	 public Post updatePost(Post n) {
	 	return postRepository.save(n);
	 }
	 
	 // deletes a post
	 public void deletePost(Long id) {
	 	postRepository.deleteById(id);
	 }
}



