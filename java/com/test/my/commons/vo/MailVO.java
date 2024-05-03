package com.test.my.commons.vo;

import java.util.List;

public class MailVO {
	
	private String Title;
	private String Content;
	private String Giver;
	private List<String> email;
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getGiver() {
		return Giver;
	}
	public void setGiver(String giver) {
		Giver = giver;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public List<String> getEmail() {
		return email;
	}
	public void setEmail(List<String> email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "MailVO [Title=" + Title + ", Content=" + Content + ", Giver=" + Giver + ", email=" + email + "]";
	}
	
}
