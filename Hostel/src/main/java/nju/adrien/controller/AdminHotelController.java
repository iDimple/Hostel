package nju.adrien.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import nju.adrien.service.AdminHotel;
import nju.adrien.vo.DayDataVO;

/**
 * @author 141250149吴秦月
 * @date 创建时间：2017年6月9日 下午8:21:25
 */
@Controller
public class AdminHotelController {
	@Autowired
	AdminHotel adminHotelService;
	// 单个旅馆每日数据界面
	@RequestMapping(value = "/admin/fiance/hotelDay", method = RequestMethod.GET)
	public ModelAndView financePage(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("admin/finance/hotelDayData");
		String hid = (String) session.getAttribute("hid");
		List<DayDataVO>vo=adminHotelService.getDayDate(hid);
		DayDataVO today=vo.get(vo.size()-1);
		modelAndView.addObject("vo", vo);
		modelAndView.addObject("today",today);
		double wanhui1=today.getMstandR()-today.getMstandO();
		double wanhui2=today.getMtaoR()-today.getMtaoO();
		int gongjiyuding=today.getStandR()+today.getTaoR();
		int gongjichengjiao=today.getStandO()+today.getTaoO();
		modelAndView.addObject("wanhui1",wanhui1);
		modelAndView.addObject("gongjiyuding",gongjiyuding);
		modelAndView.addObject("gongjiyudingm",today.getMtaoR()+today.getMstandR());
		modelAndView.addObject("gongjichengjiao",gongjichengjiao);
		modelAndView.addObject("gongjichengjiaom",today.getMstandO()+today.getMtaoO());
		modelAndView.addObject("wanhui2",wanhui2);
		modelAndView.addObject("wanhuiall",wanhui2+wanhui1);
		return modelAndView;
	}
	//预测销售额
	@RequestMapping(value = "/admin/fiance/predictpage", method = RequestMethod.GET)
	public ModelAndView predictPage(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("admin/finance/predict");
		String hid = (String) session.getAttribute("hid");
		List<DayDataVO>vo=adminHotelService.getDayDate(hid);
		for(int i=0;i<vo.size();i++){
			vo.get(i).setAll(vo.get(i).getMstandO()+vo.get(i).getMtaoO());
		}
		modelAndView.addObject("vo", vo);
		return modelAndView;
	}

}
