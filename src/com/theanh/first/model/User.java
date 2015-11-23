package com.theanh.first.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity(name = "USER")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "Id")
	private int id;

	@Column(name = "Name", nullable = false, unique = true)
	private String name;

	@Column(name = "Password", nullable = false)
	private String password;

	public User() {
	}

	public User(int id, String name, String pass) {
		this.id = id;
		this.name = name;
		this.password = pass;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
