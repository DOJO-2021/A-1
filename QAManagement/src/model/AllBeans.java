package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class AllBeans implements Serializable {
	private String user_id;
	private String user_pw;
	private String name;
	private String user_class;
	private String position;
	private Timestamp r_date;
	private int q_id;
	private String situation;
	private String q_content;
	private String people;
	private String category;
	private int first;
	private String q_image;
	private int a_id;
	private String a_content;
	private String a_image;

	public AllBeans() {
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUser_class() {
		return user_class;
	}
	public void setUser_class(String user_class) {
		this.user_class = user_class;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public Timestamp getR_date() {
		return r_date;
	}
	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}
	public int getQ_id() {
		return q_id;
	}
	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public String getQ_image() {
		return q_image;
	}
	public void setQ_image(String q_image) {
		this.q_image = q_image;
	}
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public String getA_image() {
		return a_image;
	}
	public void setA_image(String a_image) {
		this.a_image = a_image;
	}
}