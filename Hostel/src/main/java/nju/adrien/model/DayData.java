package nju.adrien.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 存放综合数据
* @author 141250149吴秦月
* @date 创建时间：2017年6月9日 下午6:44:52
*/
@Entity
@Table(name = "daydata", schema = "hostel")
public class DayData {
	private int daydataid;
	//酒店id
	private String hid;
	//日期
	private Date day;
	//原预定当天入住标准总数
    private int standR;
  //当天入住标准实际
    private int standO;
    
    
  //原预定当天入住套件总数
    private int taoR;
  //当天入住套件实际
    private int taoO;
    
  //原预定当天入住标准总数金额
    private double mstandR;
  //当天入住标准实际金额
    private double mstandO;
  //原预定当天入住套件总数金额
    private double mtaoR;
  //当天入住套件实际金额
    private double mtaoO;
    //预定成交比 标准 数量
    private double ratea;
  //预定成交比 套房 数量
    private double rateb;
  //预定成交比 标准 金额
    private double ratec;
  //预定成交比 套房  金额
    private double rated;
	public double getRatea() {
		return ratea;
	}
	public void setRatea(double ratea) {
		this.ratea = ratea;
	}
	public double getRateb() {
		return rateb;
	}
	public void setRateb(double rateb) {
		this.rateb = rateb;
	}
	public double getRatec() {
		return ratec;
	}
	public void setRatec(double ratec) {
		this.ratec = ratec;
	}
	public double getRated() {
		return rated;
	}
	public void setRated(double rated) {
		this.rated = rated;
	}
	public void setMtaoO(double mtaoO) {
		this.mtaoO = mtaoO;
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
	public int getStandR() {
		return standR;
	}
	public void setStandR(int standR) {
		this.standR = standR;
	}
	public int getStandO() {
		return standO;
	}
	public void setStandO(int standO) {
		this.standO = standO;
	}
	public int getTaoR() {
		return taoR;
	}
	public void setTaoR(int taoR) {
		this.taoR = taoR;
	}
	public int getTaoO() {
		return taoO;
	}
	public void setTaoO(int taoO) {
		this.taoO = taoO;
	}
	public double getMstandR() {
		return mstandR;
	}
	public void setMstandR(double  mstandR) {
		this.mstandR = mstandR;
	}
	public double  getMstandO() {
		return mstandO;
	}
	public void setMstandO(double  mstandO) {
		this.mstandO = mstandO;
	}
	public double  getMtaoR() {
		return mtaoR;
	}
	public void setMtaoR(double  mtaoR) {
		this.mtaoR = mtaoR;
	}
	public double  getMtaoO() {
		return mtaoO;
	}
	public void setMtaoO(int mtaoO) {
		this.mtaoO = mtaoO;
	}
	
	@Id
	public int getDaydataid() {
		return daydataid;
	}
	public void setDaydataid(int daydataid) {
		this.daydataid = daydataid;
	}
    
   
}
