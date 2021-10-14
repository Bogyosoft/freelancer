package com.bogyo.freelancer.controller;

import com.bogyo.freelancer.model.Job;
import com.bogyo.freelancer.repository.JobRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/jobs")
public class JobResource {

  @Autowired
  private JobRepository jobRepository;

  @GetMapping
  public ResponseEntity<List<Job>> getJobs(){
    return ResponseEntity.ok(jobRepository.findAll());
  }

  @PostMapping
  public ResponseEntity<Job> createJob(@RequestBody Job job){
    return ResponseEntity.ok(jobRepository.save(job));
  }
}
