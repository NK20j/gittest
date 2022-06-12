package service;

import java.util.ArrayList;
import java.util.List;


import items.Authority;

public class AuthorityService {
	public List<Authority> findAllAuthorities(List<Authority> authorities, String username){
		List<Authority> allAuthorities = new ArrayList<Authority>();
		for (Authority newAuthorities : authorities) {
			if(newAuthorities.getUsername().equals(allAuthorities)) {
				allAuthorities.add(newAuthorities);
			}
		}
		return allAuthorities;
}
}
