package com.bogyo.freelancer.component;

import com.bogyo.freelancer.TestDataLoader;
import com.bogyo.freelancer.controller.UserResource;
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
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import static org.springframework.test.util.AssertionErrors.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
public class ItemResourceComponentTests {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ItemRepository itemRepository;

    @Autowired
    private SourceRepository sourceRepository;

    @Autowired
    private UserRepository userRepository;

    TestDataLoader testDataLoader = new TestDataLoader();

    @Before
    public void setup(){
        userRepository.save(getMockUser());
        sourceRepository.save(getMockSource());

    }

    @After
    public void teardown(){
        itemRepository.deleteAll();
    }

    @Test
    public void testTempEntitiyApi() throws Exception{
        postItem(testDataLoader.loadTestData("ItemPostRequest.txt"));
        Item actualItem = itemRepository.findById(1L).get();
        assertEquals("Items properties do not match", getExpectedItem().getProperties(), actualItem.getProperties());
        assertEquals("Items status do not match", getExpectedItem().getStatus(), actualItem.getStatus());
        assertEquals("Items sources do not match", getExpectedItem().getSource(), actualItem.getSource());
        assertEquals("Items owner do not match", getExpectedItem().getSource().getOwner(), actualItem.getSource().getOwner());
    }

    private void postItem(String content) throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/items")
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
        return user;
    }

    private Source getMockSource(){
        userRepository.findAll().forEach(w -> System.out.println("asd" + w.getId()));
        Source source = new Source();
        source.setLocation("location");
        source.setId(1);
        source.setOwner(userRepository.findById(1L).get());
        return source;
    }

    private Item getExpectedItem(){
        Item item = new Item();
        item.setProperties("properties");
        item.setDestination("dest");
        item.setSource(getMockSource());
        item.setStatus("OK");
        return item;
    }
}
