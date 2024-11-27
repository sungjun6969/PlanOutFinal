package kr.ac.kopo.planout.model;

import java.util.List;

public class Product {
	
	private Long id;
	private String name;
	private int price;
	private String info;
	private String category;
	private String uuid;
	private String filename;
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	private List<Photo> photo;
	
	public List<Photo> getPhoto() {
		return photo;
	}
	public void setPhoto(List<Photo> photo) {
		this.photo = photo;
	}

}

