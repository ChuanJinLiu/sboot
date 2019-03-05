package com.ajin.sboot.dao;

import com.ajin.sboot.model.Emp;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Japoul
 */
@Repository
public interface  EmpRepository extends JpaRepository<Emp, Integer> {
    /**
     * 根据名字查询员工
     * @param name
     * @return
     */
    Emp findByName(String name);
}