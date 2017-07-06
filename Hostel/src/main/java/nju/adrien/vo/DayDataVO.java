package nju.adrien.vo;

import java.sql.Date;

/**
 * 存放综合数据
* @author 141250149吴秦月
* @date 创建时间：2017年6月9日 下午6:44:52
*/
public class DayDataVO {
	private int daydataid;
	//酒店id
	private String hid;
	//日期
	private String day;
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
  //预定成交比 总  数量
    private double ratee;
  //预定成交比 总  金额
    private double ratef;
    //实际成交总金额
    private double all;
	public double getAll() {
		return all;
	}
	public void setAll(double all) {
		this.all = all;
	}
	public double getRatee() {
		return ratee;
	}
	public void setRatee(double ratee) {
		this.ratee = ratee;
	}
	public double getRatef() {
		return ratef;
	}
	public void setRatef(double ratef) {
		this.ratef = ratef;
	}
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
	public String getDay() {
		return day.toString();
	}
	public void setDay(String day) {
		this.day = day.toString();
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
	
	public int getDaydataid() {
		return daydataid;
	}
	public void setDaydataid(int daydataid) {
		this.daydataid = daydataid;
	}
    
   
}
