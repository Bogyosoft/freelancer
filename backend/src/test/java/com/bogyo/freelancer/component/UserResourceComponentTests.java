package com.bogyo.freelancer.component;

import com.bogyo.freelancer.TestDataLoader;
import com.bogyo.freelancer.model.User;
import com.bogyo.freelancer.repository.UserRepository;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.annotation.Order;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import java.util.List;

import static org.springframework.test.util.AssertionErrors.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc(addFilters = false)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class UserResourceComponentTests {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private UserRepository userRepository;

    TestDataLoader testDataLoader = new TestDataLoader();
    String token;

    @BeforeEach
    public void setup() throws Exception {
        //userRepository.save(getMockAdmin());
        //token = login(testDataLoader.loadTestData("LoginPostRequest.txt"));
    }

    @AfterEach
    public void teardown() {
        userRepository.deleteAll();
    }

    @Test
    @Order(1)
    public void testCreateUser() throws Exception {
        postUser(testDataLoader.loadTestData("UserPostRequest.txt"));
        User actualUser = userRepository.findById(3L).get();

        assertEquals("Users username do not match", getExpectedUser().getUsername(), actualUser.getUsername());
        assertEquals("Users password do not match", getExpectedUser().getPassword(), actualUser.getPassword());
        assertEquals("Users role do not match", getExpectedUser().getRole(), actualUser.getRole());
        assertEquals("Users score do not match", getExpectedUser().getScore(), actualUser.getScore());
    }

    @Test
    @Order(2)
    public void testUpdateUser() throws Exception {
        postUser(testDataLoader.loadTestData("UserPostRequest2.txt"));
        updateUser(testDataLoader.loadTestData("UserPutRequest.txt"));
        User actualUser = userRepository.findById(2L).get();

        assertEquals("Users username do not match", getUpdatedUser().getUsername(), actualUser.getUsername());
        assertEquals("Users password do not match", getUpdatedUser().getPassword(), actualUser.getPassword());
        assertEquals("Users role do not match", getUpdatedUser().getRole(), actualUser.getRole());
        assertEquals("Users score do not match", getUpdatedUser().getScore(), actualUser.getScore());

    }

    @Test
    @Order(3)
    public void testGetUsers() throws Exception {
        String users =  getUsers();
        int expectedUsers = userRepository.findAll().size();

        assertEquals("The number of users do not match", expectedUsers, users.split("\"id\":").length - 1);
    }

    private void postUser(String content) throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/user")
                .contentType("application/json")
                .content(content))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    private void updateUser(String content) throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.put("/api/v1/user")
                .contentType("application/json")
                .content(content))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    private String getUsers() throws Exception {
        return mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/user")
                .contentType("application/json"))
                .andExpect(MockMvcResultMatchers.status().isOk())
        .andReturn().getResponse().getContentAsString();

    }

    private User getExpectedUser(){
        User user = new User();
        user.setUsername("username");
        user.setPassword("password");
        user.setRole("ROLE_USER");
        user.setScore(1);
        return user;
    }

    private User getUpdatedUser() {
        User user = new User();
        user.setUsername("test");
        user.setPassword("newPassword");
        user.setRole("ROLE_USER");
        user.setScore(1);
        return user;
    }


}

