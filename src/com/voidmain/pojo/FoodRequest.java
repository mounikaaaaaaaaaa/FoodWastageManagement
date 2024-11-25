package com.voidmain.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "FoodRequest")
public class FoodRequest {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String orphanage;
    private String agent;
    private String description;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrphanage() {
		return orphanage;
	}
	public void setOrphanage(String orphanage) {
		this.orphanage = orphanage;
	}
	public String getAgent() {
		return agent;
	}
	public void setAgent(String agent) {
		this.agent = agent;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
