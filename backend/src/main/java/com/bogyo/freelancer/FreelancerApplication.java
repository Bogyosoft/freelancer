package com.bogyo.freelancer;

import com.bogyo.freelancer.model.User;
import com.bogyo.freelancer.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
@EnableSwagger2
public class FreelancerApplication {

	public static void main(String[] args) {
		SpringApplication.run(FreelancerApplication.class, args);
	}


}
