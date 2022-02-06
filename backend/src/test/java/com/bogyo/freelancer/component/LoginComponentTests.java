package com.bogyo.freelancer.component;

import com.bogyo.freelancer.TestDataLoader;
import com.bogyo.freelancer.repository.UserRepository;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.event.annotation.AfterTestMethod;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import javax.servlet.http.Cookie;

import static org.springframework.test.util.AssertionErrors.assertNotNull;

@RunWith(SpringRunner.class)
@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
public class LoginComponentTests {

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
    public void testLogin() throws Exception {
        token = login(testDataLoader.loadTestData("LoginPostRequest.txt"));

        assertNotNull("Login do not work", token);

        getUsersOk();

        logout();
    }

    private String login(String content) throws Exception {
        return mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/auth")
                .contentType("application/json")
                .content(content)).andReturn().getResponse().getCookie("token").getValue();
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