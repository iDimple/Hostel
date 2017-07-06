package nju.adrien.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import nju.adrien.model.DayRank;
import nju.adrien.service.AdminHotel;
import nju.adrien.service.RankService;
import nju.adrien.vo.DayDataVO;

/**
 * 销售管理单个酒店
 * @author 141250149吴秦月
 * @date 创建时间：2017年6月2日 上午9:41:24
 */
@Controller
public class SaleController {
	@Autowired
	AdminHotel adminHotelService;
	@Autowired
	private RankService rankService;
	// 销售管理界面，默认点进去是每天的数据，订单数量
	@RequestMapping(value = "/sale/dayOrderNum", method = RequestMethod.GET)
	public ModelAndView saleDayOrderNum(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("admin/finance/sale");
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
		modelAndView.addObject("gongjichengjiao",gongjichengjiao);
		modelAndView.addObject("wanhui2",wanhui2);
		modelAndView.addObject("wanhuiall",wanhui2+wanhui1);
		return modelAndView;
	}
	// 销售管理界面，默认点进去是每月的数据，订单数量
		@RequestMapping(value = "/sale/monthOrderNum", method = RequestMethod.GET)
		public ModelAndView saleMonthOrderNum(HttpSession session) {
			ModelAndView modelAndView = new ModelAndView("admin/finance/hotelMonthData");
			String hid = (String) session.getAttribute("hid");
			
			return modelAndView;
		}
		
		// 销售管理界面，默认点进去是每季度的数据，订单数量
				@RequestMapping(value = "/sale/seasonOrderNum", method = RequestMethod.GET)
				public ModelAndView saleSeasonOrderNum(HttpSession session) {
					ModelAndView modelAndView = new ModelAndView("admin/finance/hotelSeasonData");
					String hid = (String) session.getAttribute("hid");
					
					return modelAndView;
				}

	// 销售管理界面，地区排名
	@RequestMapping(value = "/sale/areaRank", method = RequestMethod.GET)
	public ModelAndView areaRank(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("admin/finance/areaRank");
		String hid = (String) session.getAttribute("hid");
		List<DayRank> vo=rankService.getDayRank();
		System.out.println(vo.size()+"rank");
		System.out.println(vo.get(0).getRank()+"rank");
		modelAndView.addObject("vo",vo);
		return modelAndView;
	}
}
