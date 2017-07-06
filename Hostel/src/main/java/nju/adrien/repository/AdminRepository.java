package nju.adrien.repository;

import nju.adrien.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;


public interface AdminRepository extends JpaRepository<Admin, String> {
}
