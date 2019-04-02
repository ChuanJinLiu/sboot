package com.ajin.sboot.dao;

import com.ajin.sboot.model.Tasks;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

/**
 * Create By Japoul
 * 2019/4/1 10:50
 *
 * @author Japoul
 */
@Repository
public interface TasksRepository extends JpaRepository<Tasks, Integer>, JpaSpecificationExecutor<Tasks> {


    /**
     * 根据id查询对应效应的数据
     *
     * @param id
     * @param enable
     * @return
     */
    Tasks findByIdAndEnable(Integer id, Boolean enable);

    /**
     * 根据名字模糊查询+分页
     *
     * @param name
     * @param pageable
     * @return
     */
    Page<Tasks> findByNameLike(String name, Pageable pageable);

    /**
     * 根据完成状态以及是否有效进行查询
     *
     * @param status
     * @param enable
     * @param userId
     * @return
     */
    Page<Tasks> findByStatusAndEnableAndUserID(String status, Boolean enable, Integer userId, Pageable pageable);

}
