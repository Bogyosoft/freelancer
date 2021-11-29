package com.bogyo.freelancer.model;

import com.bogyo.freelancer.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class DataLoader implements ApplicationRunner {

    @Autowired
    private UserRepository userRepository;

    public void run(ApplicationArguments args) {
        User user = new User();
        user.setRole("ROLE_ADMIN");
        user.setScore(0);
        user.setUsername("admin");
        user.setPassword("admin");
        userRepository.save(user);
    }
}