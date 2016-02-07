package com.theanh.first.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "USER")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "ID")
	private int id;

	@Column(name = "USERNAME", nullable = false, unique = true)
	private String userName;

	@Column(name = "PASSWORD", nullable = false)
	private String password;
	
	@Column(name = "ROLE", nullable = false)
	private String role;

	public User() {
	}

	public User(int id, String name, String pass, String role) {
		this.id = id;
		this.userName = name;
		this.password = pass;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String name) {
		this.userName = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	@Override
    public String toString() {
        return "User [id=" + id + ", userName=" + userName + ", password=" + password
                + ", role=" + role;
    }

}
