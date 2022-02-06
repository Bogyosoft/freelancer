package com.bogyo.freelancer.component;

import com.bogyo.freelancer.TestDataLoader;
import com.bogyo.freelancer.model.Source;
import com.bogyo.freelancer.model.User;
import com.bogyo.freelancer.repository.SourceRepository;
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
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import javax.servlet.http.Cookie;

import static org.springframework.test.util.AssertionErrors.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
public class SourceResourceComponentTests {
    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private SourceRepository sourceRepository;

    @Autowired
    private UserRepository userRepository;

    TestDataLoader testDataLoader = new TestDataLoader();

    String token = null;

    @Before
    public void setup() throws Exception {

    }

    @After
    public void teardown(){
        sourceRepository.deleteAll();
    }

    @Test
    public void testSourceApi() throws Exception {
        token = login(testDataLoader.loadTestData("LoginPostRequest.txt"));

        postSource(testDataLoader.loadTestData("SourcePostRequest.txt"));
        Source actualSource = sourceRepository.findById(1L).get();

        assertEquals("Sources location do not match", "test_location", actualSource.getLocation());
        assertEquals("Owner username do not match", "admin", actualSource.getOwner().getUsername());
        assertEquals("Owner password do not match", "admin", actualSource.getOwner().getPassword());

        getSources();
    }

    private void postSource(String content) throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/sources")
                .contentType("application/json")
                .content(content)
                .cookie(new Cookie("token", token)))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }


    private String login(String content) throws Exception {
        return mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/auth")
                .contentType("application/json")
                .content(content)).andReturn().getResponse().getCookie("token").getValue();
    }

    private void getSources() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/sources")
                .contentType("application/json")
                .cookie(new Cookie("token", token)))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }
}
