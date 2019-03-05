package com.ajin.sboot.controller;

import com.ajin.sboot.model.User;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Japoul
 */

@RestController
public class UserController {
    @RequestMapping("/getUser")
    public User getUser() {
        User user=new User();
        user.setName("小明");
        user.setAge(18);
        user.setAddr("大学城");
        return user;
    }
}