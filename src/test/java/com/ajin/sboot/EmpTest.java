package com.ajin.sboot;

import com.ajin.sboot.dao.EmpRepository;
import com.ajin.sboot.model.Emp;
import junit.framework.Assert;
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

        empRepository.save(new Emp("Hab1", 15l));
        empRepository.save(new Emp("Hab2", 18l));

        Assert.assertEquals(11, empRepository.findAll().size());
    }

}