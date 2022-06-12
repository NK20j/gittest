package stream;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import items.Author;
import items.Post;

public class PostService {
	public List<Post> findAllPostOfAuthor(List<Post> post, String author){
		List<Post> postAuthor = post.stream()
				.filter(Post -> ((items.Post) post).getAuthor().equals(author))
				.collect(Collectors.toList());
		
		return postAuthor;
	}
	
	public List<Post> findAllPostContentContainsString(List<Post> post, String key){
		List<Post> postTitle = post.stream()
				.filter(Post -> ((items.Post) post).getContent().equals(key))
				.filter(Post -> ((items.Post) post).getTitle().equals(key))
				.collect(Collectors.toList());
		
		return postTitle;
	}
	public List<Post> find10NewestPostByAuthor(List<Post> post, String author, int number){
		List<Post> newestPost = post.stream()
				.filter(Post -> ((items.Post) post).getAuthor().equals(author))
				.forEach(Post -> {
					
					if (post.size() < 0) {
						return null;
					}
					if (post.size() <= 10) {
						 number = post.size(); 
					}
					if (post.size() > 10) {
						newestPost.add(null);
					}
				}
				.limit(10);
				
				return newestPost;
		}
	public List<Post> find10NewestPostByAuthor(List<Post> post, String author, int number, String key){
		List<Post> postTitle = post.stream()
				.filter(Post -> ((items.Post) post).getContent().equals(key))
				.filter(Post -> ((items.Post) post).getTitle().equals(key))
				.filter(Post -> ((items.Post) post).getAuthor().equals(author))
				.forEach(Post -> {
					
					if (post.size() < 0) {
						return null;
					}
					if (post.size() <= 10) {
						 number = post.size(); 
					}
					if (post.size() > 10) {
						newestPost.add(null);
					}
				}
				
				.limit(10);
					
			return postTitle;
	}


	public List<Post> findAllPostAllUser(List<Post> author, List<Post> post){
		List<Post> allPost = (List<Post>) post.stream()
				.filter(Post -> ((items.Post) post).getAuthor().equals(author))
				.collect(Collectors.toList());
		return allPost;
	}
	
	public List<Post> findPostToday(List<Post> postList){
		List<Post> todayPost = postList.stream()
				.filter(post -> post.getDate().equals(LocalDate.now()))
				.filter(post -> post.getDate()!= null)
				.collect(Collectors.toList());
	return todayPost;
}
	
}
