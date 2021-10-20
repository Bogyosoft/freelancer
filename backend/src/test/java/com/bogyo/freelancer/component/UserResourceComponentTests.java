package com.bogyo.freelancer.component;

import com.bogyo.freelancer.TestDataLoader;
import com.bogyo.freelancer.model.User;
import com.bogyo.freelancer.repository.UserRepository;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import static org.springframework.test.util.AssertionErrors.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
public class UserResourceComponentTests {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private UserRepository userRepository;

    TestDataLoader testDataLoader = new TestDataLoader();

    @Before
    public void setup() {

    }

    @After
    public void teardown() {
        userRepository.deleteAll();
    }

    @Test
    public void testTempEntitiyApi() throws Exception{
        postUser(testDataLoader.loadTestData("UserPostRequest.txt"));
        User actualUser = userRepository.findById(1L).get();

        assertEquals("Users username do not match", getExpectedUser().getUsername(), actualUser.getUsername());
        assertEquals("Users password do not match", getExpectedUser().getPassword(), actualUser.getPassword());
        assertEquals("Users role do not match", getExpectedUser().getRole(), actualUser.getRole());
        assertEquals("Users score do not match", getExpectedUser().getScore(), actualUser.getScore());
    }

    private void postUser(String content) throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/user")
                .contentType("application/json")
                .content(content))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    private User getExpectedUser(){
        User user = new User();
        user.setUsername("username");
        user.setPassword("password");
        user.setRole("string");
        user.setScore(1);
        return user;
    }
}
