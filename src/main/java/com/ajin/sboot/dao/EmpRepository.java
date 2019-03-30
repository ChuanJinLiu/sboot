package com.ajin.sboot.dao;

import com.ajin.sboot.model.Emp;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    List<Emp> findByNameLikeOrderByIdDesc(String name);


    /**
     * 根据age查询员工
     * @param age
     * @return
     */
    List<Emp> findByAge(Long age);

}
