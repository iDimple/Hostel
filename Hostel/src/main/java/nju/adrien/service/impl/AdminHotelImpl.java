package nju.adrien.service.impl;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.adrien.model.DayData;
import nju.adrien.repository.AdminHotelRepository;
import nju.adrien.service.AdminHotel;
import nju.adrien.vo.DayDataVO;

/**
* @author 141250149吴秦月
* @date 创建时间：2017年6月9日 下午7:53:23
*/
@Service
public class AdminHotelImpl implements AdminHotel{
	 @Autowired
	    private  AdminHotelRepository  adminHotelRepo;
	@Override
	public List<DayDataVO> getDayDate(String hid) {
		List<DayData> po=adminHotelRepo.findByHid(hid);
		List<DayDataVO> results=new ArrayList<DayDataVO>();
		for(int i=0;i<po.size();i++){
			DayData p=po.get(i);
			DayDataVO vo=new DayDataVO();
			
			vo.setDay(p.getDay().toString());
			vo.setDaydataid(p.getDaydataid());
			vo.setHid(p.getHid());
			vo.setMstandO(p.getMstandO());
			vo.setMstandR(p.getMstandR());
			vo.setMtaoO(p.getMtaoO());
			vo.setMtaoR(p.getMtaoR());
			vo.setStandO(p.getStandO());
			vo.setStandR(p.getStandR());
			vo.setTaoO(p.getTaoO());
			vo.setTaoR(p.getTaoR());
			vo.setRatea(p.getRatea());
			vo.setRateb(p.getRateb());
			vo.setRatec(p.getRatec());
			vo.setRated(p.getRated());
			vo.setRatee(new BigDecimal((double)(p.getTaoO()+p.getStandO())/(p.getTaoR()+p.getStandR())).setScale(2, RoundingMode.UP).doubleValue());
			vo.setRatef(new BigDecimal((double)(p.getMstandO()+p.getMtaoO())/(p.getMstandR()+p.getMtaoR())).setScale(2, RoundingMode.UP).doubleValue());
			results.add(vo);
		}
		return results;
		
	}
	private java.util.Date getDate(java.sql.Date date){
		return new java.util.Date (date.getTime());
	}
}
