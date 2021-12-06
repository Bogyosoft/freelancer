package com.bogyo.freelancer.controller;

import com.bogyo.freelancer.model.User;
import com.bogyo.freelancer.repository.UserRepository;

import java.util.List;

import com.bogyo.freelancer.security.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

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
        user.setRole("ROLE_USER");
        userRepository.save(user);
        return ResponseEntity.ok(user);
    }

    @PutMapping
    public ResponseEntity<User> updateUser(@RequestBody User user) {
        logger.info("User {} {} {}",user.getUsername(),user.getPassword(),user.getRole());
        User dbUser = userRepository.findByUsername(user.getUsername());
        if(dbUser == null)
            return ResponseEntity.badRequest().build();
        dbUser.setPassword(user.getPassword());
        userRepository.save(dbUser);
        return  ResponseEntity.ok(user);
    }

    @GetMapping
    public ResponseEntity<List<User>> getUsers(){
        return ResponseEntity.ok(userRepository.findAll());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deleteUser(@PathVariable Long id){
        if(securityUtils.getLoggedInUserAuthorities().equals("ROLE_ADMIN"))
            userRepository.delete(userRepository.findById(id).get());
        return ResponseEntity.ok().build();
    }

    @GetMapping("/loggedin")
    public ResponseEntity<String> getLoggedInUsername(){
        System.out.println(SecurityContextHolder.getContext().getAuthentication().getAuthorities().iterator().next().toString());
        return ResponseEntity.ok(securityUtils.getLoggedInUsername());
    }

    @GetMapping("/logout")
    public ResponseEntity logout(HttpServletResponse response){
        SecurityContextHolder.clearContext();
        Cookie cookie = new Cookie("token", "deleted");
        cookie.setPath("/");
        //cookie.setSecure(true);
        //cookie.setHttpOnly(true);
        cookie.setMaxAge(114);
        response.addCookie(cookie);
        response.addHeader("Access-Control-Allow-Headers", "X-Requested-With, X-HTTP-Method-Override, Content-Type, Accept");
        response.addHeader("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,UPDATE,OPTIONS");
        response.addHeader("Access-Control-Expose-Headers", "Set-Cookie");
        System.out.println("logout");
        return ResponseEntity.ok().build();
    }
}
