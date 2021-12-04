package com.bogyo.freelancer.component;

import static org.springframework.test.util.AssertionErrors.assertEquals;

import com.bogyo.freelancer.TestDataLoader;
import com.bogyo.freelancer.enums.ItemStatus;
import com.bogyo.freelancer.model.Item;
import com.bogyo.freelancer.model.Job;
import com.bogyo.freelancer.model.Source;
import com.bogyo.freelancer.model.User;
import com.bogyo.freelancer.repository.ItemRepository;
import com.bogyo.freelancer.repository.JobRepository;
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

@RunWith(SpringRunner.class)
@SpringBootTest
@DirtiesContext
@AutoConfigureMockMvc
public class JobResourceComponentTests {

  @Autowired
  private MockMvc mockMvc;

  @Autowired
  private ItemRepository itemRepository;

  @Autowired
  private SourceRepository sourceRepository;

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private JobRepository jobRepository;

  TestDataLoader testDataLoader = new TestDataLoader();

  @Before
  public void setup(){
    userRepository.save(getMockUser());
    sourceRepository.save(getMockSource());
    itemRepository.save(getMockItem());
  }

  @After
  public void teardown(){
    itemRepository.deleteAll();
  }

  @Test
  public void testJobResource() throws Exception{
    postItem(testDataLoader.loadTestData("JobPostRequest.txt"));
    Job foundJob = jobRepository.findAll().stream().findFirst().get();
    System.out.println(foundJob.getFreelancer().getId() + " asdww " + getExpectedJob().getId());
    System.out.println(foundJob.getItem().getId() + " " + getExpectedJob().getId());
    assertEquals("Job in DB does not match expected job", getExpectedJob().getFreelancer().getId(), foundJob.getFreelancer().getId());
    assertEquals("Job in DB does not match expected job", getExpectedJob().getFreelancer().getUsername(), foundJob.getFreelancer().getUsername());

    assertEquals("Job in DB does not match expected job", getExpectedJob().getItem().getId(), foundJob.getItem().getId());
    assertEquals("Job in DB does not match expected job", getExpectedJob().getItem().getProperties(), foundJob.getItem().getProperties());


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

  private Source getMockSource(){
    userRepository.findAll().forEach(w -> System.out.println("asd" + w.getId()));
    Source source = new Source();
    source.setLocation("location");
    source.setId(1);
    source.setOwner(userRepository.findById(1L).get());
    return source;
  }

  private Item getMockItem(){
    Item item = new Item();
    item.setProperties("properties");
    item.setDestination("dest");
    item.setSource(getMockSource());
    item.setStatus(ItemStatus.TO_BE_DELIVERED);
    item.setId(1);
    return item;
  }

  private Job getExpectedJob(){
    Job job = new Job();
    job.setFreelancer(getMockUser());
    job.setItem(getMockItem());
    job.setId(1);
    return job;
  }

  private void postItem(String content) throws Exception {
    mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/jobs")
        .contentType("application/json")
        .content(content))
        .andExpect(MockMvcResultMatchers.status().isOk());
  }
}
