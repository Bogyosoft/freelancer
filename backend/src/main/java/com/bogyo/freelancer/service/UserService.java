package com.bogyo.freelancer.service;

import com.bogyo.freelancer.enums.UserGroups;
import com.bogyo.freelancer.model.User;
import com.bogyo.freelancer.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public User createUser(User user){
        user.setUsername(user.getUsername());
        //TODO: use somekind of hashing to store pw
        user.setPassword(user.getPassword());
        user.setScore(0);
        user.setRole(user.getRole());
        return user;
    }
}
