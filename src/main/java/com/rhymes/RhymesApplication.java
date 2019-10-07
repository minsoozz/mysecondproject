package com.rhymes; 

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@EnableCaching
@SpringBootApplication
public class RhymesApplication {

	public static void main(String[] args) {
		SpringApplication.run(RhymesApplication.class, args);
	}

}
