package nju.adrien.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import nju.adrien.model.DayRank;

/**
* @author 141250149吴秦月
* @date 创建时间：2017年6月23日 下午4:26:11
*/
@Controller
public class ManagerAnaController {
	// 销售管理界面，地区排名
		@RequestMapping(value = "/sale/manager", method = RequestMethod.GET)
		public ModelAndView areaRank(HttpSession session) {
			ModelAndView modelAndView = new ModelAndView("admin/finance/ManagerDay");
			String hid = (String) session.getAttribute("hid");
			return modelAndView;
		}
		
		// 地区分析
				@RequestMapping(value = "/sale/areaAnly", method = RequestMethod.GET)
				public ModelAndView areaAnaly(HttpSession session) {
					ModelAndView modelAndView = new ModelAndView("admin/finance/areaAnaly");
					String hid = (String) session.getAttribute("hid");
					return modelAndView;
				}
				// 地区分析
				@RequestMapping(value = "/sale/areaAnlyM", method = RequestMethod.GET)
				public ModelAndView areaAnalyM(HttpSession session) {
					ModelAndView modelAndView = new ModelAndView("admin/finance/areaAnMonth");
					String hid = (String) session.getAttribute("hid");
					return modelAndView;
				}
				// 
				@RequestMapping(value = "/sale/areaAnlyS", method = RequestMethod.GET)
				public ModelAndView areaAnalyS(HttpSession session) {
					ModelAndView modelAndView = new ModelAndView("admin/finance/areaAnalySeason");
					String hid = (String) session.getAttribute("hid");
					return modelAndView;
				}
				
				// 客栈排名
				@RequestMapping(value = "/sale/hotelRank", method = RequestMethod.GET)
				public ModelAndView hotelRank(HttpSession session) {
					ModelAndView modelAndView = new ModelAndView("admin/finance/HotelRank");
					String hid = (String) session.getAttribute("hid");
					return modelAndView;
				}
				// kkehu排名
				@RequestMapping(value = "/sale/CustRank", method = RequestMethod.GET)
				public ModelAndView custRank(HttpSession session) {
					ModelAndView modelAndView = new ModelAndView("admin/finance/CustomerRank");
					String hid = (String) session.getAttribute("hid");
					return modelAndView;
				}
}
