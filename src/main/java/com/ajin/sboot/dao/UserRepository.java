package com.ajin.sboot.dao;

import com.ajin.sboot.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author Japoul
 */
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    /**
     * 根据名字和密码查询，判断登录
     *
     * @param userName
     * @param password
     * @return
     */
    User findByNameAndPassword(String userName, String password);
}
