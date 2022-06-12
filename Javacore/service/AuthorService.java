package service;

import java.util.ArrayList;
import java.util.List;

import items.Author;
import items.Post;

public class AuthorService {
	public List<Author> findAuthorByName(List<Author> author, String name){
		List<Author> checkedName = new ArrayList<Author>();
		for (Author a : author) {
			if(a.getUsername().equals(checkedName)) {
				author.add(a);
			}
		}
		return checkedName;
	}
	
	public List<Author> findAuthorByEmail(List<Author> author, String email){
		List<Author> checkedEmail = new ArrayList<Author>();
		for (Author e : author) {
			if(e.getEmail().equals(checkedEmail)) {
				author.add(e);
			}
		}
		return checkedEmail;
	}
	
	public List<Author> findAuthorByPost(List<Post>postlist){
		List<Author> checkedAllAuthor = new ArrayList<>();
		for (Author a : checkedAllAuthor) {
			checkedAllAuthor.add(a);
		}
		
		List<Post> list = new ArrayList<>();
		for (Post p : postlist) {
			String author = p.getAuthor();
			if(!list.contains(author)){
				list.add(p);
			}
		}
		
		return checkedAllAuthor;
		
	}
}
