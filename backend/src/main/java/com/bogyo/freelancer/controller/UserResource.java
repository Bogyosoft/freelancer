package com.bogyo.freelancer.controller;

import com.bogyo.freelancer.model.User;
import com.bogyo.freelancer.repository.UserRepository;

import java.util.List;

import com.bogyo.freelancer.security.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@RestController
@RequestMapping("api/v1/user")
@EnableSwagger2
public class UserResource {

    @Autowired
    UserRepository userRepository;

    @Autowired
    SecurityUtils securityUtils;

    private static final Logger logger = LoggerFactory.getLogger(UserResource.class);

    @PostMapping
    public ResponseEntity<User> createUser(@RequestBody User user){
        logger.info("User {} {} {}",user.getUsername(),user.getPassword(),user.getRole());
        if(userRepository.findByUsername(user.getUsername()) != null)
                return ResponseEntity.badRequest().build();
        userRepository.save(user);
        return ResponseEntity.ok(user);
    }

    @GetMapping
    public ResponseEntity<List<User>> getUsers(){
        return ResponseEntity.ok(userRepository.findAll());
    }

    @DeleteMapping
    public ResponseEntity deleteUser(@PathVariable Long id){
        userRepository.delete(userRepository.findById(id).get());
        return ResponseEntity.ok().build();
    }

    @GetMapping("/loggedin")
    public ResponseEntity<String> getLoggedInUsername(){
        return ResponseEntity.ok(securityUtils.getLoggedInUsername());
    }
}
