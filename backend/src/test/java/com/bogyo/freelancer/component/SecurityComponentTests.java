package com.bogyo.freelancer.component;

import com.bogyo.freelancer.TestDataLoader;
import com.bogyo.freelancer.repository.UserRepository;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.event.annotation.AfterTestMethod;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import javax.servlet.http.Cookie;

import static org.springframework.test.util.AssertionErrors.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
public class SecurityComponentTests {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private UserRepository userRepository;

    TestDataLoader testDataLoader = new TestDataLoader();

    String token = null;

    @Before
    public void setup() throws Exception { }

    @After
    public void teardown() {
        userRepository.deleteAll();
    }


    @Test
    public void testNoAuthActions() throws Exception {
        // If the testcase fails, it means that any user can POST a new user without authentication!
        postUserNoAuth(testDataLoader.loadTestData("UserPostRequest2.txt"));
    }

    @Test
    public void testLoggedInActions() throws Exception {

        token = login(testDataLoader.loadTestData("LoginPostRequest.txt"));

        postUser(testDataLoader.loadTestData("UserPostRequest.txt"));

        getUsersOk();

        deleteUser();

        logout();
    }


    private String login(String content) throws Exception {
        return mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/auth")
                .contentType("application/json")
                .content(content)).andReturn().getResponse().getCookie("token").getValue();
    }

    private void postUser(String content) throws Exception {
          mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/user")
                .contentType("application/json")
                  .cookie(new Cookie("token", token))
                .content(content))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    private void postUserNoAuth(String content) throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/user")
                .contentType("application/json")
                .content(content))
                .andExpect(MockMvcResultMatchers.status().is(401));
    }

    private void deleteUser() throws Exception {
        long user = userRepository.findByUsername("username").getId();
        mockMvc.perform(MockMvcRequestBuilders.delete("/api/v1/user/" + user)
                .contentType("application/json")
                .cookie(new Cookie("token", token)))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    private void getUsersOk() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/user")
                .contentType("application/json")
                .cookie(new Cookie("token", token)))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    private void logout() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/user/logout")
                .contentType("application/json")
                .cookie(new Cookie("token", token)))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }
}
