package com.bogyo.freelancer.component;

import com.bogyo.freelancer.TestDataLoader;
import com.bogyo.freelancer.model.Item;
import com.bogyo.freelancer.model.Source;
import com.bogyo.freelancer.model.User;
import com.bogyo.freelancer.repository.ItemRepository;
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

    @Before
    public void setup(){
        userRepository.save(getMockUser());

    }

    @After
    public void teardown(){
        sourceRepository.deleteAll();
    }

    @Test
    public void testTempEntitiyApi() throws Exception{
        postSource(testDataLoader.loadTestData("SourcePostRequest.txt"));
        Source actualSource = sourceRepository.findById(1L).get();

        assertEquals("Sources location do not match", getExpectedSource().getLocation(), actualSource.getLocation());
        assertEquals("Sources owner do not match", getExpectedSource().getOwner(), actualSource.getOwner());

    }

    private void postSource(String content) throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/sources")
                .contentType("application/json")
                .content(content))
                .andExpect(MockMvcResultMatchers.status().isOk());
    }

    private User getMockUser(){
        User user = new User();
        user.setPassword("pw");
        user.setRole("ROLE_TEST");
        user.setScore(1);
        user.setUsername("user");
        user.setId(1);
        return user;
    }

    private Source getExpectedSource(){
        Source source = new Source();
        source.setLocation("test_location");
        source.setOwner(getMockUser());
        return source;
    }
}
