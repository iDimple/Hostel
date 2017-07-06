package nju.adrien.util;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;



public class Initial {
	private Connection conn ;
	private String DBname = "Research_DB";
	private String[] start = {"2016-01-20","2016-03-12","2016-05-23","2016-09-20","2016-12-12"};
	private String[] namelist = {"王丽莉","张三","李四","王二","赵无","周刘","丽颖","新月","胭脂","陈风","玉华"};

	public static void main(String[] args) {
		//insertTOproject(String id, String pmid, Date StartDate,Date EndDate,String name, String description) 
		Initial initialer = new Initial();
		//initialer.insertPlan();
		//initialer.insertDayDate();
	}
		
	public void insertDayDate() {
		String day=getSpecifiedDayAfter("2016-12-31");
		for(int i = 1;i<166;i++){


			String hid = "1000001";
			Date date =Date.valueOf(day);
			day=getSpecifiedDayAfter(day);
			//原预定当天入住标准总数
			int standR=(int) (i+10+(int)(Math.random()*8)*Math.pow(-1, i));
			//当天入住标准实际
			int standO=standR-(int)(Math.random()*5);
			//原预定当天入住套件总数
			int taoR=(int) (i+5+(int)(Math.random()*3)*Math.pow(-1, i));
			//当天入住套件实际
			int taoO=taoR-(int)(Math.random()*3);
			
//			if(i>40&&i<50){
//				standR=(int) (80-i+(int)(Math.random()*8)*Math.pow(-1, i));;
//				standO=standR-(int)(Math.random()*5);
//				taoR=(int) (80-i+(int)(Math.random()*3)*Math.pow(-1, i));
//				taoO=taoR-(int)(Math.random()*3);
//				
//			}
//			if(i>50&&i<100){
//				standR=(int) (i+10+(int)(Math.random()*8)*Math.pow(-1, i))-30;
//				standO=standR-(int)(Math.random()*5);
//				taoR=(int) (i+5+(int)(Math.random()*3)*Math.pow(-1, i))-30;
//				taoO=taoR-(int)(Math.random()*3);
//				
//			}if(i>100&&i<120){
//				standR=(int) (200-i+(int)(Math.random()*8)*Math.pow(-1, i))-30;;
//				standO=standR-(int)(Math.random()*5);
//				taoR=(int) (200-i+(int)(Math.random()*3)*Math.pow(-1, i))-30;
//				taoO=taoR-(int)(Math.random()*3);
//				
//			}if(i>122){
//				standR=(int) (i+10+(int)(Math.random()*8)*Math.pow(-1, i))-80;
//				standO=standR-(int)(Math.random()*5);
//				taoR=(int) (i+5+(int)(Math.random()*3)*Math.pow(-1, i))-80;
//				taoO=taoR-(int)(Math.random()*3);
//				
//			}
//伪造一些误差数据
			if(i%7==0){
				standR=standR-2;
				standO=standO-2;
				taoR=taoR-2;
				taoO=taoO-2;
			}
			if(i%13==0){
				standR=standR-4;
				standO=standO-4;
				taoR=taoR-4;
				taoO=taoO-4;
			}
			if(i%17==0){
				standR=standR-10;
				standO=standO-10;
				taoR=taoR-10;
				taoO=taoO-10;
			}
			if(i==5){
				standR=50;
				standO=48;
				taoR=30;
				taoO=28;
			}
			if(i==10){
				standR=5;
				standO=4;
				taoR=3;
				taoO=2;
			}
			if(i==20){
				standR=50;
				standO=49;
				taoR=30;
				taoO=29;
			}
			if(i==30){
				standR=5;
				standO=4;
				taoR=3;
				taoO=2;
			}
			if(i==40){
				standR=15;
				standO=14;
				taoR=13;
				taoO=12;
			}
			if(i==50){
				standR=5;
				standO=3;
				taoR=3;
				taoO=3;
				
			}
			if(i==60){
				standR=25;
				standO=23;
				taoR=23;
				taoO=23;
			}
			if(i==70){
				standR=15;
				standO=13;
				taoR=13;
				taoO=13;
			}
			if(i==100){
				standR=6;
				standO=4;
				taoR=3;
				taoO=2;
			}
			if(i==129){
				standR=30;
				standO=28;
				taoR=20;
				taoO=19;
			}if(i==157){
				standR=29;
				standO=29;
				taoR=18;
				taoO=18;
			}
			
			//原预定当天入住标准总数金额
			double mstandR=standR*100;
			//当天入住标准实际金额
			double mstandO=standO*100;
			//原预定当天入住套件总数金额
			double mtaoR=taoR*200;
			//当天入住套件实际金额
			double mtaoO=taoO*200;
			//预定成交比 标准 数量
			double ratea=new BigDecimal((double)standO/standR).setScale(2, RoundingMode.UP).doubleValue();
			//预定成交比 套房 数量
			double rateb=new BigDecimal((double)taoO/taoR).setScale(2, RoundingMode.UP).doubleValue();
			//预定成交比 标准 金额
			double ratec=new BigDecimal(mstandO/mstandR).setScale(2, RoundingMode.UP).doubleValue();
			//预定成交比 套房  金额
			double rated=new BigDecimal(mtaoO/mtaoR).setScale(2, RoundingMode.UP).doubleValue();

			String sql = "INSERT INTO daydata VALUE ("+"'"+i+"',"+"'"+hid+"',"+"'"+date+"',"+"'"+standR+"',"+"'"+standO+"',"
					+"'"+taoR+"','"+taoO+"','"+mstandR+"','"+mstandO+"','"+mtaoR+"','"+mtaoO+
					"','"+ratea+"','"+rateb+"','"+ratec+"','"+rated+"');";
			insert(sql);

		}
		System.out.println("daydata");
	}
	public static String getSpecifiedDayAfter(String specifiedDay) {  
		Calendar c = Calendar.getInstance();  
		java.util.Date date = null;  
		try {  
			date = new SimpleDateFormat("yy-MM-dd").parse(specifiedDay);  
		} catch (ParseException e) {  
			e.printStackTrace();  
		}  
		c.setTime(date);  
		int day = c.get(Calendar.DATE);  
		c.set(Calendar.DATE, day + 1);  

		String dayAfter = new SimpleDateFormat("yyyy-MM-dd")  
				.format(c.getTime());  
		return dayAfter;  
	}  

	private void insert(String sql){

		conn = SqlHelper.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.execute();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public void insertPlan() {
		for(int i = 6;i<76;i++){
			String planid = "00000000000"+i;
			String hid = "1000001";
			Date date =Date.valueOf(start[i%5]);
			String type = "标准间";
			double price = 200;
			int available=106-i;
			String sql = "INSERT INTO hotel_plan VALUE ("+"'"+planid+"',"+"'"+hid+"',"+"'"+date+"',"+"'"+type+"',"+"'"+price+"',"+"'"+available+"');";
			insert(sql);

		}
		System.out.println("plan");
	}

	

}
