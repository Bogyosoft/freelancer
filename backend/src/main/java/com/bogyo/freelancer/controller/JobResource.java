package com.bogyo.freelancer.controller;

import com.bogyo.freelancer.model.Item;
import com.bogyo.freelancer.model.Job;
import com.bogyo.freelancer.model.User;
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

  @GetMapping
  public ResponseEntity<List<Job>> getJobs(@RequestParam(required = false) Long userId){
    if(userId == null)
      return ResponseEntity.ok(jobRepository.findAll());
    Optional<User> user = userRepository.findById(userId);
    if(user.isPresent()){
      return ResponseEntity.ok(jobRepository.findByfreelancer(user.get()));
    }
    return ResponseEntity.badRequest().build();
  }

  @PostMapping
  public ResponseEntity<Job> createJob(@RequestBody Item item){
    User user = userRepository.findByUsername(securityUtils.getLoggedInUsername());
    Job job = new Job();
    job.setFreelancer(user);
    job.setItem(item);
    return ResponseEntity.ok(jobRepository.save(job));
  }
}
