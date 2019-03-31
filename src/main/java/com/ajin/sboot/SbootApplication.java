package com.ajin.sboot;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class SbootApplication {

	private final static Logger logger = LoggerFactory.getLogger(SbootApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(SbootApplication.class, args);
		logger.info("The service of Japoul that start successful!  ");
	}

}
