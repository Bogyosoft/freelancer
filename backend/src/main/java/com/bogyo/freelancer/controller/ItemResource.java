package com.bogyo.freelancer.controller;

import com.bogyo.freelancer.model.Item;
import com.bogyo.freelancer.repository.ItemRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/items")
public class ItemResource {

  @Autowired
  ItemRepository itemRepository;

  @PostMapping
  public ResponseEntity createItem(@RequestBody Item item){
    itemRepository.save(item);
    return ResponseEntity.ok(item);
  }

  @GetMapping
  public ResponseEntity<List<Item>> getItems(){
    return ResponseEntity.ok(itemRepository.findAll());
  }
}
