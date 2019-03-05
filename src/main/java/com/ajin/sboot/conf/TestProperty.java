package com.ajin.sboot.conf;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author Japoul
 */
@Component
public class TestProperty {
    @Value("${com.sboot.name}")
    private String name;
    @Value("${com.sboot.copyright}")
    private String copyright;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCopyright() {
        return copyright;
    }

    public void setCopyright(String copyright) {
        this.copyright = copyright;
    }
    
}