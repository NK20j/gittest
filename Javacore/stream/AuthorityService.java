package stream;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import items.Authority;

public class AuthorityService {
	public List<Authority> findAllAuthorities(List<Authority> authorities, String username){
		List<Authority> allAuthorities = authorities.stream()
				.filter(Author -> ((items.Author)authorities).getUsername().equals(username))
				.collect(Collectors.toList());
	
		return allAuthorities;
	}
}