package com.ajin.sboot;

import com.ajin.sboot.model.Emp;
import junit.framework.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.concurrent.TimeUnit;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestRedis {
    @Autowired
    private StringRedisTemplate stringRedisTemplate;
    @Autowired
    private RedisTemplate redisTemplate;

    @Test
    public void test() throws Exception {
        //字符串键值对
        ValueOperations<String, String> opsForValue = stringRedisTemplate.opsForValue();
        opsForValue.set("aaa", "111");
        Assert.assertEquals("111", stringRedisTemplate.opsForValue().get("aaa"));
    }

    @Test
    public void testObj() throws InterruptedException {
        Emp emp = new Emp("RedisTest", 22L);
        //对象键值对
        ValueOperations<String, Emp> operations = redisTemplate.opsForValue();
        // 相当于redis命令的 set name jack
        operations.set("emp1", emp);
        //设置键值对，后两个参数是设置多少时间后销毁，这里是一秒后销毁
        System.out.println("emp1:" + operations.get("emp1").toString());
        operations.set("emp2", emp, 1, TimeUnit.SECONDS);
        System.out.println("emp2:" + operations.get("emp2").toString());
        //睡眠单位ms
        Thread.sleep(1000);
        System.out.println("执行delete后 emp2:" + operations.get("emp2"));
        //删除缓存中的emp1
        redisTemplate.delete("emp1");
        //判断对象是否存在
        boolean exists = redisTemplate.hasKey("emp1");
        if (exists) {
            System.out.println("emp exists is true");
        } else {
            System.out.println("emp exists is false");
        }
//        Assert.assertEquals("aa", operations.get("com.neo.f").getUserName());
//        ValueOperations<String, String> opsForValue = stringRedisTemplate.opsForValue();
//        opsForValue.set("TestValueOperations:test", "empTestwww.aaa", 10, TimeUnit.SECONDS);
//        Thread.sleep(5000);
//        System.out.println(opsForValue.get("TestValueOperations:test"));//liu2
//        Thread.sleep(5000);
//        System.out.println(opsForValue.get("TestValueOperations:test"));//null
    }
}