package com.bogyo.freelancer.controller;

import com.bogyo.freelancer.model.User;
import com.bogyo.freelancer.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@RestController("api/v1/user")
@EnableSwagger2
public class UserResource {

    @Autowired
    UserService userService;

    @PostMapping
    public ResponseEntity<User> createUser(@RequestBody User user){
        userService.createUser(user);
        return new ResponseEntity.ok(user);
    }
}
