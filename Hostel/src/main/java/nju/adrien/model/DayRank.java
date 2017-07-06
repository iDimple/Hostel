package nju.adrien.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
* @author 141250149吴秦月
* @date 创建时间：2017年6月22日 上午10:48:39
*/
@Entity
@Table(name = "arearankday", schema = "hostel")
public class DayRank {
	private int id;
	//酒店id
	private String hid;
	private Date day;
	private int rank;
	private String name;
	private String saleNUm;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSaleNUm() {
		return saleNUm;
	}
	public void setSaleNUm(String saleNUm) {
		this.saleNUm = saleNUm;
	}
	@Id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
}
