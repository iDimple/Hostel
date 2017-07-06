package nju.adrien.repository;

import nju.adrien.model.VipInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;


public interface VipInfoRepository extends JpaRepository<VipInfo, String> {

    @Query("select a from VipInfo a where a.phone = ?1")
    VipInfo findByPhone(String phone);

    @Query("select a.vid from VipInfo a where vid=(select max(vid) from VipInfo)")
    String getMaxVid();

    @Query("select a from VipInfo a where a.bankid = ?1")
    VipInfo findByBankid(String bankid);

    @Query("select a from VipInfo a where a.phone like ?1")
    List<VipInfo> findByKey(String phone_key);

}
