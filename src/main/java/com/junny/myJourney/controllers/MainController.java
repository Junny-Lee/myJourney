package com.junny.myJourney.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.junny.myJourney.models.Post;
import com.junny.myJourney.models.User;
import com.junny.myJourney.services.PostService;
import com.junny.myJourney.services.UserService;
import com.junny.myJourney.validator.UserValidator;

@Controller
public class MainController {
	 private final UserService userService;
	 private final UserValidator userValidator;
	 private final PostService postService;
 
	 public MainController(UserService userService, UserValidator userValidator, PostService postService) {
	        this.userService = userService;
	        this.userValidator = userValidator;
	        this.postService = postService; 
	    }
	 @RequestMapping("/")
	 public String firstPage() {
	     return "firstPage.jsp";
	 }
	 
	 @RequestMapping("/register")
	 public String registerFormAndLogin(@ModelAttribute("user") User user) {
	     return "register.jsp";
	 }
	 
	 @RequestMapping(value="/registration", method=RequestMethod.POST)
	 public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		 // if result has errors, return the registration page (don't worry about validations just now)
	     // else, save the user in the database, save the user id in session, and redirect them to the /home route
		 userValidator.validate(user, result);
		 if(result.hasErrors()) {
			 return "register.jsp";
		 }
		 User u = userService.registerUser(user);
		 session.setAttribute("userId", u.getId());
		 return "redirect:/posts";
	 }
	 
	 @RequestMapping("/loginNow")
	 public String lgoin(@ModelAttribute("user") User user) {
	     return "login.jsp";
	 }
	 
	 @RequestMapping(value="/login", method=RequestMethod.POST)
	 public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
	     // if the user is authenticated, save their user id in session
	     // else, add error messages and return the login page
		 boolean isAuthenticated = userService.authenticateUser(email, password);
		 if (isAuthenticated) {
			 User u = userService.findByEmail(email);
			 session.setAttribute("userId", u.getId());
			 return "redirect:/home";
		 } else {
			 model.addAttribute("error", "Invalid Credentials. Please try again.");
			 return "loginRegPage.jsp";
		 }
	 }
	 
	 @RequestMapping("/posts")
	 public String home(HttpSession session, Model model) {
	     // get user from session, save them in the model and return the home page
		 Long userId = (Long) session.getAttribute("userId");
		 User u = userService.findUserById(userId);
		 //List<Post> posts = postService.allPosts();
		 // dont need this now, but might later for public space!!!
		 List<Post> posts = postService.allPostsDesc();
		 int countPosts = posts.size();
		 model.addAttribute("posts", posts);
		 model.addAttribute("post", new Post()); // look at this line!
		 model.addAttribute("user", u);
		 model.addAttribute("countPosts", countPosts);
		 return "allPosts.jsp";
	 }
	 
	 @RequestMapping("/logout")
	 public String logout(HttpSession session) {
	     // invalidate session
	     // redirect to login page
		 session.invalidate();
		 return "redirect:/";
	 }
	 
	 // added this to allow user to change journalColor (works like an edit)
	 @RequestMapping(value="/user/{id}/process", method=RequestMethod.PUT) 
	 public String updateUser(HttpSession session, @RequestParam("journalColor") String journalColor){
		 Long userId = (Long) session.getAttribute("userId");
		 User user = userService.findUserById(userId);
		 user.setJournalColor(journalColor);
    	 userService.updateUser(user);
         return "redirect:/home";
	 }
	 
	 @RequestMapping(value="/createPost", method=RequestMethod.POST)
	 public String createNew(@Valid @ModelAttribute("post") Post post, BindingResult result, 
				Model model, HttpSession session) {
		 if(result.hasErrors()) {
			 System.out.println(result.getFieldErrors());
			 return "allPosts.jsp";
		 }
		 postService.createPost(post);
		 return "redirect:/posts";
	 }
	 
	 //added this create new
	 @RequestMapping("/newPost")
	 public String newPost(HttpSession session, Model model) {
	     // get user from session, save them in the model and return the home page
		 Long userId = (Long) session.getAttribute("userId");
		 User u = userService.findUserById(userId);
		 List<Post> posts = postService.allPosts();
		 model.addAttribute("posts", posts);
		 model.addAttribute("post", new Post()); // look at this line!
		 model.addAttribute("user", u);
		 return "newPost.jsp";
	 }
	 
	 @RequestMapping("/posts/{postId}")
	 public String postPage(HttpSession session, Model model, @PathVariable("postId") Long postId) {
	     // get user from session, save them in the model and return the home page
		 Long userId = (Long) session.getAttribute("userId");
		 User u = userService.findUserById(userId);
		 Post p = postService.findPost(postId);
		 model.addAttribute("post", new Post()); // look at this line!
		 model.addAttribute("user", u);
		 model.addAttribute("p", p);
		 return "postPage.jsp";
	 }
	 
	 @RequestMapping("/posts/{id}/edit") // display jsp file 
	 public String edit(@PathVariable("id") Long id, Model model) {
	     Post post = postService.findPost(id);
	     model.addAttribute("post", post);
	     return "editPost.jsp";
	 }
	 
	 @RequestMapping(value="/posts/{id}/process", method=RequestMethod.PUT) 
	 public String update(@Valid @ModelAttribute("post") Post post, BindingResult result, HttpSession session){
	     if (result.hasErrors()) {
	    	 System.out.println(result.getAllErrors());
	         return "editPost.jsp";
	     } else {
	    	 post.setCreator(userService.findUserById((Long)session.getAttribute("userId"))); // need to cast 
	    	 postService.updatePost(post);
	         return "redirect:/posts";
	     }
	 }

	 @RequestMapping(value="/posts/{id}/delete") // delete
	 public String destroy(@PathVariable("id") Long id) {
	     postService.deletePost(id);
	     return "redirect:/posts";
	 }
	 
	 @RequestMapping("/home")
	 public String index(HttpSession session, Model model) {
	     // get user from session, save them in the model and return the home page
		 Long userId = (Long) session.getAttribute("userId");
		 User u = userService.findUserById(userId);
		 List<Post> posts = postService.allPosts();
		 model.addAttribute("posts", posts);
		 model.addAttribute("post", new Post()); // look at this line!
		 model.addAttribute("user", u);
		 return "homePage.jsp";
	 }
	 
	 // new: setting page
	 @RequestMapping("/settings")
	 public String settings(HttpSession session, Model model) {
	     // get user from session, save them in the model and return the home page
		 Long userId = (Long) session.getAttribute("userId");
		 User u = userService.findUserById(userId);
		 List<Post> posts = postService.allPosts();
		 model.addAttribute("posts", posts);
		 model.addAttribute("post", new Post()); // look at this line!
		 model.addAttribute("user", u);
		 return "settings.jsp";
	 }
	 
	 // this is new: added search functionality
	 @RequestMapping("/search/{search}") // READ matched posts
	 public String viewSearch(Model model,
			 @PathVariable(value = "search") String search, HttpSession session) {
	     ArrayList<Post> posts = postService.allMatchedPosts(search); // changed this from List to ArrayList
	     model.addAttribute("posts", posts);
	     Long userId = (Long) session.getAttribute("userId");
		 User u = userService.findUserById(userId);
		 model.addAttribute("user", u);
		 int countPosts = posts.size();
		 model.addAttribute("countPosts", countPosts);
	     return "/matchedPosts.jsp";
	 }
	 
	 @PostMapping("/search") // READ ALL MATCHED SONGS // short hand of post
	 public String search(@RequestParam(value = "search") String search) {
	     return "redirect:/search/" + search;
	 }
	 
	 @RequestMapping("/posts/{postId}/favorited")
	 public String favorite(HttpSession session, Model model, @PathVariable("postId") Long postId) {
	     // get user from session, save them in the model and return the home page
		 Long userId = (Long) session.getAttribute("userId");
		 User u = userService.findUserById(userId);
		 Post p = postService.findPost(postId);
		 if (p.isFavorite() == false) {p.setFavorite(true);}
		 else {p.setFavorite(false);}
		 model.addAttribute("post", new Post()); // look at this line!
		 model.addAttribute("user", u);
		 model.addAttribute("p", p);
		 postService.createPost(p); // save the favorite because create method saves
		 return "postPage.jsp";
	 }
	 
}

