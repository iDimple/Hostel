package nju.adrien.service;

import java.util.List;

import nju.adrien.vo.DayDataVO;

/**
* @author 141250149吴秦月
* @date 创建时间：2017年6月9日 下午7:49:25
*/
public interface AdminHotel {
	//得到hid旅馆的每日数据，预定取消比
List<DayDataVO>getDayDate(String hid);
}
