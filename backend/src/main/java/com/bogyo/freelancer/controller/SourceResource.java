package com.bogyo.freelancer.controller;

import com.bogyo.freelancer.model.Source;
import com.bogyo.freelancer.repository.SourceRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/sources")
public class SourceResource {

  @Autowired
  private SourceRepository sourceRepository;

  @GetMapping
  public ResponseEntity<List<Source>> getSources(){
    return ResponseEntity.ok(sourceRepository.findAll());
  }

  @PostMapping
  public ResponseEntity<Source> createSource(@RequestBody Source source){
    return ResponseEntity.ok(sourceRepository.save(source));
  }
}
