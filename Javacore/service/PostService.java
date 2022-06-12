package service;

import java.util.ArrayList;

import java.util.List;

import items.Post;

public class PostService {
	public List<Post> findAllPostOfAuthor(List<Post> post, String author){
		List<Post> postAuthor = new ArrayList<Post>();
		for (Post a : post) {
			if(a.getAuthor().equals(author)) {
				post.add(a);
			}
		}
		return postAuthor;
	}


	public List<Post> findAllPostContentContainsString(List<Post> post, String key){
		List<Post> postTitle = new ArrayList<Post>();
		for (Post a : post) {
			while (a.getTitle() != null || a.getContent() !=null) {
				
				if(a.getTitle().contains(key)) {
					post.add(a);
				}
				if(a.getContent().contains(key)) {
					post.add(a);
				}
			
			}
	
		}
		return postTitle;
	}
	
	public List<Post> find10NewestPostByAuthor(List<Post> post, String author, int number){
		List<Post> newestPost = new ArrayList<Post>();
		for (Post a : post) {
			if (((Post) post).getAuthor().equals(author)) {
				newestPost.add(a);   }
			}
			if (post.size() < 0) {
				return null;
			}
			if (post.size() <= 10) {
				 number = post.size(); 
			}
			if (post.size() > 10) {
				newestPost.add(null);
			}
	
			
		return newestPost;
		}
	
			
	public List<Post> find10NewestPostContentContainsString(List<Post> post, String key, String author, int number){
		List<Post> postTitle = new ArrayList<Post>();
		for (Post a : post) {
			while (a.getTitle() != null || a.getContent() !=null) {
				
				if(a.getTitle().contains(key)) {
					post.add(a);
				}
				if(a.getContent().contains(key)) {
					post.add(a);
				}
				if (post.size() < 0) {
					return null;
				}
				if (post.size() <= 10) {
					 number = post.size(); 
				}
				if (post.size() > 10) {
					postTitle.add(null);
				}
			}
	
		}
		return postTitle;
	}
		
	public List<Post> findAllPostAllUser(List<Post> author, List<Post> post){
		List<Post> allPost = new ArrayList<Post>();
		for (Post a : post) {
			if(author.contains(((Post) post).getAuthor())); {
				post.add(a);
			}
		}
	
		return allPost;
	}
	
}


			

	