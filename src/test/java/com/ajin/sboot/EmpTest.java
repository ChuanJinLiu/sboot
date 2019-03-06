package com.ajin.sboot;

import com.ajin.sboot.dao.EmpRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest()
public class EmpTest {

    @Autowired
    private EmpRepository empRepository;

    @Test
    public void test() throws Exception {
        System.out.println(empRepository.findByAge(20l));
    }

}