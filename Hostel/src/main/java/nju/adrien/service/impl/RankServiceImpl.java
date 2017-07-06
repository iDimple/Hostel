package nju.adrien.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nju.adrien.model.DayRank;
import nju.adrien.repository.RankRepository;
import nju.adrien.service.RankService;

/**
* @author 141250149吴秦月
* @date 创建时间：2017年6月22日 上午11:01:06
*/
@Service
public class RankServiceImpl implements RankService{
	 @Autowired
	 private RankRepository rank;
	@Override
	public List<DayRank> getDayRank() {
		// TODO Auto-generated method stub
		return rank.findAll();
	}

}
