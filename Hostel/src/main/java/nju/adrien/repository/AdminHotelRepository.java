package nju.adrien.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import nju.adrien.model.Apply;
import nju.adrien.model.DayData;

/**
* @author 141250149吴秦月
* @date 创建时间：2017年6月9日 下午7:57:35
*/
public interface AdminHotelRepository extends JpaRepository<Apply, String>  {
	@Query("select a from DayData a where a.hid like ?1")
    List<DayData> findByHid(String hid);
}
