package nju.adrien.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import nju.adrien.model.DayRank;

/**
* @author 141250149吴秦月
* @date 创建时间：2017年6月22日 上午10:55:09
*/
public interface RankRepository extends JpaRepository<DayRank, String>{
	
}
