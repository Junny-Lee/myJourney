package com.junny.myJourney.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.junny.myJourney.models.Post;
import com.junny.myJourney.models.User;
import com.junny.myJourney.repositories.PostRepository;

@Service
public class PostService {
	 private final PostRepository postRepository;

	 public PostService(PostRepository postRepository) {
	     this.postRepository = postRepository;
	 }
	 
	 // returns all the posts
	 public List<Post> allPosts() {
	     return postRepository.findAll(); // https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#reference 
	 }
	
	 // created this one for search!
	 public ArrayList<Post> allMatchedPosts(String search, User user){
		 ArrayList<Post> output = new ArrayList<Post>(); // did not let us have List; can't instantiate List
		 HashMap<Long,Post> map = new HashMap<Long,Post>(); // HashMap = dictionary of Java (dictionaries were in Python and JS)
		 List<Post> matchedPosts = postRepository.findByTitleContaining(search);
		 List<Post> matchedPostsInText = postRepository.findByTextContaining(search);
		 for (int i = 0; i <matchedPostsInText.size(); i++) {
			 map.put(matchedPostsInText.get(i).getId(), matchedPostsInText.get(i)); // map acts as a dictionary (can only have one key value). so we want that key to be the ID (keeps it from duplicating)
		 }
		 for (int i = 0; i <matchedPosts.size(); i++) {
			 map.put(matchedPosts.get(i).getId(), matchedPosts.get(i)); // map acts as a dictionary (can only have one key value). so we want that key to be the ID (keeps it from duplicating)
		 }
		 // everything is in the map now, we need to put it into a List<Post>
		 Set<Long> keys = map.keySet(); // Set sets the keys (empty key map)
         for(Long key : keys) {
        	 if (map.get(key).getCreator().getId().equals(user.getId())) {        		 
        		 output.add(map.get(key));
        	 }
         }
		 return output;
	 }
	 
	// created this one for PUBLIC search!
	 public ArrayList<Post> allMatchedPublicPosts(String search, User user){
		 ArrayList<Post> output = new ArrayList<Post>(); // did not let us have List
		 HashMap<Long,Post> map = new HashMap<Long,Post>(); // HashMap = dictionary of Java (dictionaries were in Python and JS)
		 List<Post> matchedPublicPosts = postRepository.findByTextContaining(search);
		 List<Post> matchedPublicPostsInText = postRepository.findByTitleContaining(search);
		 for (int i = 0; i <matchedPublicPostsInText.size(); i++) {
			 map.put(matchedPublicPostsInText.get(i).getId(), matchedPublicPostsInText.get(i)); // map acts as a dictionary (can only have one key value). so we want that key to be the ID (keeps it from duplicating)
		 }
		 for (int i = 0; i <matchedPublicPosts.size(); i++) {
			 map.put(matchedPublicPosts.get(i).getId(), matchedPublicPosts.get(i)); // map acts as a dictionary (can only have one key value). so we want that key to be the ID (keeps it from duplicating)
		 }
		 // everything is in the map now, we need to put it into a List<Post>
		 Set<Long> keys = map.keySet(); // Set sets the keys (empty key map)
         for(Long key : keys) {
        	 if (!map.get(key).isPersonal()) {
        		 output.add(map.get(key));
        	 }
         }
		 return output;
	 }
	 
	 // created this one for DESC
	 public List<Post> allPostsDesc(){
		 return postRepository.postsDescByDate();
	 }
	 
	 // created this one for ASC
	 public List<Post> allPostsAsc(){
		 return postRepository.postsAscByDate();
	 }
	 
	 // created this one for public posts
	 public List<Post> allPublicPosts(){
		 return postRepository.findAllPublicPosts();
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



