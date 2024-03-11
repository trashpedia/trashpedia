package com.kks.trashpedia;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class TrashpediaApplication {

	public static void main(String[] args) {
		SpringApplication.run(TrashpediaApplication.class, args);
	}
}