package com.personal.geocaching.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginUser {

	@NotEmpty(message="Email is required.")
	@Size(min=3, message="must be atleast 3 characters.")
	@Email(message="Please enter a valid email.")
	private String email;
	
	@NotEmpty(message="Password is required")
	@Size(min=8, message="Must be atleast 8 characters.")
	private String password;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}