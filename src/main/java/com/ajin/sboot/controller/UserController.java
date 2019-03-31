package com.ajin.sboot.controller;

import com.ajin.sboot.dao.UserRepository;
import com.ajin.sboot.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.UUID;


/**
 * @author Japoul
 */
@RestController
public class UserController {

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private UserRepository userRepository;

    /**
     * 登录验证
     *
     * @param request
     * @return
     */
    @RequestMapping("/loginUser")
    public HttpEntity<?> login(HttpServletRequest request) {
        String name = request.getParameter("userName");
        String password = request.getParameter("password");
        User user = userRepository.findByNameAndPassword(name, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.status(500).build();
        }
    }

    /**
     * 自动获取缓存 value的值即为k值
     *
     * @return
     */
    @RequestMapping("/getUser")
    @Cacheable(value = "user-test")
    public String getUser() {
        User user=new User();
        user.setName("小明");
        user.setAge(18);
        user.setAddr("大学城");
        ValueOperations<String, String> operations = stringRedisTemplate.opsForValue();
        // 相当于redis命令的 set name jack
        operations.set("user-test", user.toString());
        System.out.println(operations.get("user-key"));
        System.out.println("若下面没出现“无缓存的时候调用”字样且能打印出数据表示测试成功");
        return user.toString();
    }

    @RequestMapping("/uid")
    String UidTest(HttpSession session) {
        UUID uid = (UUID) session.getAttribute("uid");
        if (uid == null) {
            uid = UUID.randomUUID();
        }
        session.setAttribute("uid", uid);
        return session.getId();
    }

}