package com.theanh.first.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.theanh.first.model.User;

public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
    private UserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
//		User user = userService.findByUserName(userName);
//		System.out.println("User : " + user);
//		if (user == null) {
//			System.out.println("User not found");
//			throw new UsernameNotFoundException("Username not found");
//		}
//		return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(), 
//				getGrantedAuthorities(user));
		return null;
		
	}
	
	public UserDetails loadUserByUsername(String userName, String password) throws UsernameNotFoundException {
		User user = userService.findByUserName(userName, password);
		System.out.println("User : " + user);
		if (user == null) {
			System.out.println("User not found");
			throw new UsernameNotFoundException("Username not found");
		}
		return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(), 
				getGrantedAuthorities(user));
		
	}

	private List<GrantedAuthority> getGrantedAuthorities(User user) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		authorities.add(new SimpleGrantedAuthority("ROLE_" + user.getRole()));
		
		System.out.print("authorities :" + authorities);
		return authorities;
	}

}
