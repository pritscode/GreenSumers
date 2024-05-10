package com.test.my.commons.vo;

import java.util.List;

public class MailVO {
	
	private String Title;
	private String Content;
	private String Reciever;
	private List<String> email;
	public String getTitle() {
		return Title;
	}
	
	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getReciever() {
		return Reciever;
	}

	public void setReciever(String reciever) {
		Reciever = reciever;
	}

	public List<String> getEmail() {
		return email;
	}

	public void setEmail(List<String> email) {
		this.email = email;
	}

	public void setTitle(String title) {
		Title = title;
	}

	@Override
	public String toString() {
		return "MailVO [Title=" + Title + ", Content=" + Content + ", Reciever=" + Reciever + ", email=" + email + "]";
	}
	
}
