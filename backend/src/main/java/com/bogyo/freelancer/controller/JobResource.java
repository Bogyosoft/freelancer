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
  public ResponseEntity<List<Job>> getJobs(){
    if(securityUtils.getLoggedInUserAuthorities().equals("ROLE_ADMIN")){
      ResponseEntity.ok(jobRepository.findAll());
    }
    return ResponseEntity.ok(
            jobRepository
                    .findByfreelancer(userRepository.findByUsername(securityUtils.getLoggedInUsername()))
    );
  }

  @PostMapping
  public ResponseEntity<Job> createJob(@RequestBody Item item){
    User user = userRepository.findByUsername(securityUtils.getLoggedInUsername());
    if (item.getSource().getOwner().getUsername() == user.getUsername())
      return ResponseEntity.badRequest().build();
    Job job = new Job();
    job.setFreelancer(user);
    job.setItem(item);
    return ResponseEntity.ok(jobRepository.save(job));
  }
}
