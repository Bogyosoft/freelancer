package com.bogyo.freelancer.controller;

import com.bogyo.freelancer.enums.ItemStatus;
import com.bogyo.freelancer.model.Item;
import com.bogyo.freelancer.model.Job;
import com.bogyo.freelancer.model.User;
import com.bogyo.freelancer.repository.ItemRepository;
import com.bogyo.freelancer.repository.JobRepository;
import java.util.List;
import java.util.Optional;

import com.bogyo.freelancer.repository.UserRepository;
import com.bogyo.freelancer.security.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/jobs")
public class JobResource {

  @Autowired
  private JobRepository jobRepository;

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private SecurityUtils securityUtils;

  @Autowired
  private ItemRepository itemRepository;

  @GetMapping
  public ResponseEntity<List<Job>> getJobs(){
    if(securityUtils.getLoggedInUserAuthorities().equals("ROLE_ADMIN")){
      return ResponseEntity.ok(jobRepository.findAll());
    }
    List<Job> list = jobRepository.findByfreelancer(userRepository.findByUsername(securityUtils.getLoggedInUsername()));
    return ResponseEntity.ok(list);
  }

  @PostMapping
  public ResponseEntity<Job> createJob(@RequestBody Item item){
    User user = userRepository.findByUsername(securityUtils.getLoggedInUsername());
    if (item.getSource().getOwner().getUsername().equals(user.getUsername()))
      return ResponseEntity.badRequest().build();
    List<Job> loggedInsJobs = jobRepository.findByfreelancer(user);
    for (int i = 0; i < loggedInsJobs.size(); ++i) {
      if(loggedInsJobs.get(i).getItem().equals(item))
        return ResponseEntity.badRequest().build();
    }
    Job job = new Job();
    job.setFreelancer(user);
    item.setStatus(ItemStatus.IN_PROGRESS);
    job.setItem(item);
    itemRepository.save(item);
    return ResponseEntity.ok(jobRepository.save(job));
  }

  @DeleteMapping("/{id}")
  public ResponseEntity deleteJob(@PathVariable Long id){
    Optional<Job> optionalJob = jobRepository.findById(id);
    if(optionalJob.isPresent()) {
      Job job = optionalJob.get();
      Optional<Item> optionalItem = itemRepository.findById(job.getItem().getId());
      jobRepository.delete(job);
      if (optionalItem.isPresent()) {
        Item item = optionalItem.get();
        item.setStatus(ItemStatus.DELIVERED);
        itemRepository.save(item);
      } else {
        System.out.println("item missing");
        ResponseEntity.badRequest();
      }
      User userToUpdateScore = userRepository.findByUsername(securityUtils.getLoggedInUsername());
      userToUpdateScore.setScore(userToUpdateScore.getScore() + 10);
      userRepository.save(userToUpdateScore);
      return ResponseEntity.ok(job);
    }
    return ResponseEntity.badRequest().build();
  }

  @PutMapping("/{id}")
  public ResponseEntity handOverJob(@PathVariable Long id){
    Optional<Job> jobToDelete = jobRepository.findById(id);
    if(jobToDelete.isPresent()) {
      jobRepository.delete(jobToDelete.get());
      Optional<Item> itemToUpdate = itemRepository.findById(jobToDelete.get().getItem().getId());
      if(itemToUpdate.isPresent()){
        Item updatedItem = itemToUpdate.get();
        updatedItem.setStatus(ItemStatus.TO_BE_DELIVERED);
        itemRepository.save(updatedItem);
        return ResponseEntity.ok(jobToDelete.get());
      }else{
        return ResponseEntity.badRequest().build();
      }
    }
    return ResponseEntity.badRequest().build();
  }
}
