package stream;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import items.Author;
import items.Post;

public class AuthorService {
	public List<Author> findAuthorByName(List<Author> author, String name){
		List<Author> checkedName = author.stream()
			.filter(Author -> ((items.Author)author).getUsername().equals(name))
			.collect(Collectors.toList());
			
	return checkedName;
	}

		
	
	public List<Author> findAuthorByEmail(List<Author> author, String email){
		List<Author> checkedEmail = author.stream()
				.filter(Author -> ((items.Author)author).getEmail().equals(author))
				.collect(Collectors.toList());
	
		return checkedEmail;
	}
	
	public List<Author> findAuthorByPost(List<Post> postlist, List<Author> author){
		List<Author> a = author.stream()
				.filter(Author -> ((items.Author)author).getUsername().equals(author))
				.collect(Collectors.toList());
		
	
		List<Post> p = postlist.stream()
				.filter(post -> {
					if(!list.contains(author)){
						list.add(p);
					}
				}
				.collect(Collectors.toList());
		return a;
	}
}
