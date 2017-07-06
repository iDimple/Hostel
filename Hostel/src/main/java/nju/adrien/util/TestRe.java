package nju.adrien.util;

import java.math.BigDecimal;

import nju.adrien.util.regression.Polyfit;

/**
 * @author 141250149吴秦月
 * @date 创建时间：2017年6月12日 上午11:32:06
 */
public class TestRe {
	public static void main(String[] args){
		try {
			//System.out.println(gradientAna());
			regression();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static String gradientAna() throws Exception {
		double[] x = new double[100];
		double[] y = new double[100];
		for(int i = 0;i<100;i++) {
			x[i] = i + 1;
			y[i] = Math.random()*10+1;		
		}
		Polyfit polyfit = new Polyfit(x, y,4);
		//斜率判断上升下降趋势
		double gradient = polyfit.gradient();
		String result="通过多项式拟合分析，拟合的销售额斜率为"+gradient;
		if(gradient>0.001){
			result+="大与0，有上升趋势";
		}else if(gradient<-0.001){
			result+="小与0，有下降趋势";
		}else{
			result+="接近0，趋势平稳";
		}

		return result;
	}
	public static void regression() throws Exception{






		/**    * 多元回归    */   
		int m=1;//自变量个数
		int n=100;//数据个数
		//存放回归系数
		double[] a = new double[m+1];  
		/** * 一元线性回归分析 *

		 * @param x[n] 
		 * * 存放自变量x的n个取值 *
		 *  @param y[n] * 
		 *  存放与自变量x的n个取值相对应的随机变量y的观察值 * 
		 *  @param n * 观察点数 * 
		 *  @param a[2] * a(0) 返回回归系数b ,a(1)返回回归系数a * 
		 *  @param dt[6] * dt(0) 返回偏差平方和q ,dt(1)返回平均标准偏差s ,
		 *  dt(2)返回回归 * dt(3)返回最大偏差umax,
		 *  dt(4)返回最小偏差umin,dt(5)返回偏差平平方和p, 均值u

		 */
		double[] dt = new double[6];  

		///自变量
		double[]close=new double[100];
		close[99]=Math.random()*10;
		////因变量
		double[] y=new double[100];
		for(int i = 0;i<99;i++) {
			close[i] = Math.random()*10;
			y[i]=close[i+1];
		}



		///
		double[]x=close;


		/*
		 *       @param n      观察数据的组数   *
		 * */
		SPT1(x, y,  n, a, dt);  
		//	a[0]+=500;
		//
		System.out.println("回归方程为：y="+a[0]+"+"+a[1]+"x1");
		//显著性分析
		System.out.println("决定系数r="+dt[2]);
		System.out.println("标准残差="+dt[1]);
		//偏回归系数分析
		//多重共线性分析。。。。
		//点预测
		double pre=0;
		double maxErr=0;
		for(int i=1;i<100;i++){

			double re=close[i];
			double xi[]={

					close[i]

			};

			pre=predict(a,xi);
			double xiangduiwucha=Math.abs((pre-re)/re);
			if(xiangduiwucha>maxErr){
				maxErr=xiangduiwucha;
			}
			System.out.println("实际："+re+"   预测："+pre+"  相对误差的绝对值："+xiangduiwucha);
			//		System.out.println(result.get(i).getDate());
			//区间预测
			double down=pre-2*dt[1];
			double up=pre+2*dt[1];
			
		}
		System.out.println("最大误差"+maxErr);
		BigDecimal   b   =   new   BigDecimal(a[0]);  
		double   f1   =   b.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue(); 
		BigDecimal   b1   =   new   BigDecimal(a[1]);  
		double   f2   =   b1.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue(); 
		BigDecimal   b2   =   new   BigDecimal(maxErr);  

		double   f3   =   b2.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue(); 
		String anly="通过线性回归分析,发现昨日收盘价对第二天开盘价有显著影响。 线性回归方程为"+
				"： y="+f1+"+"+f2+"x "
				+" 从上述回归方程看，昨日收盘价"+"上涨1元"+"第二天开盘价上涨 "+f2+" 元"
				+ "，常数项值为 "+f1;
		anly+=" 通过对回归模型的验证，把统计的数据代入回归模型对比实际的股票价格进行误差检验，结果显示预测值和实际值误差范围在小于 "
				+f3+" ，检验结果证明线性回归模型可以用来预测股票价格。";
		anly+="采用的数据是过去一年的日数据,对 "+" 股价水平的变化做出定量化研究。";
		BigDecimal   preb   =   new   BigDecimal(pre);  
		double   prf1   =   preb.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue(); 
		anly+="通过今日收盘价，预测明日开盘价为 "+prf1;
		System.out.println(anly);
	}
	/**
	 * 
	 * @param xishu,方程y=a0+a1x1+...中的系数ai
	 * @param sta，xi
	 * @return
	 */
	private static double predict(double[] xishu,double[] sta){
		double result=xishu[0];
		System.out.println(xishu[0]+"a0");
		if(xishu.length>1){
			for(int i=1;i<xishu.length;i++){
				result=result+xishu[i]*sta[i-1];
			}
		}
		//		if(result>sta[0]*1.1){
		//			result=sta[0]*1.1;
		//		}
		//		if(result<sta[0]*0.9){
		//			result=sta[0]*0.9;
		//		}
		if(result<=0){
			double ss=0;
			for(int i=0;i<sta.length;i++)
				ss+=sta[i];

			return ss/sta.length;
		}
		return result;
	}

	/** * 一元线性回归分析 *

	 * @param x[n] 
	 * * 存放自变量x的n个取值 *
	 *  @param y[n] * 
	 *  存放与自变量x的n个取值相对应的随机变量y的观察值 * 
	 *  @param n * 观察点数 * 
	 *  @param a[2] * a(0) 返回回归系数b ,a(1)返回回归系数a * 
	 *  @param dt[6] * dt(0) 返回偏差平方和q ,dt(1)返回平均标准偏差s ,
	 *  dt(2)返回回归 * dt(3)返回最大偏差umax,
	 *  dt(4)返回最小偏差umin,dt(5)返回偏差平平方和p, 均值u

	 */

	public static void SPT1(double[] x, double[] y, int n, double[] a, double[] dt){
		int i; 
		double xx, yy, e, f, q, u, p, umax, umin, s;
		xx = 0.0; yy = 0.0; 
		for (i = 0; i <= n - 1; i++) { 
			xx = xx + x[i] / n;
			yy = yy + y[i] / n; 
		} 
		e = 0.0;
		f = 0.0; 
		for (i = 0; i <= n - 1; i++) {
			q = x[i] - xx; 
			e = e + q * q;    
			f = f + q * (y[i] - yy);
		} 
		a[1] = f / e; 
		a[0] = yy - a[1] * xx; 
		q = 0.0;
		u = 0.0; 
		p = 0.0; 
		umax = 0.0; 
		umin = 1.0e+30;
		for (i = 0; i <= n - 1; i++) {
			s = a[1] * x[i] + a[0]; 
			q = q + (y[i] - s) * (y[i] - s); 
			p = p + (s - yy) * (s - yy); q = x[i] - xx; 
			e = Math.abs(y[i] - s); 
			if (e > umax) 
				umax = e;
			umin = e; 
			if (e < umin)
				u = u + e / n; 
		}
		dt[1] = Math.sqrt(q / n); 
		dt[0] = q; 
		dt[2] = p;
		dt[3] = umax; 
		dt[4] = umin;
		dt[5] = u; 
	}




}
