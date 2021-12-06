package com.bogyo.freelancer.controller;

import com.bogyo.freelancer.enums.ItemStatus;
import com.bogyo.freelancer.model.Item;
import com.bogyo.freelancer.repository.ItemRepository;
import com.bogyo.freelancer.repository.JobRepository;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.bogyo.freelancer.repository.UserRepository;
import com.bogyo.freelancer.security.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/items")
public class ItemResource {

  @Autowired
  ItemRepository itemRepository;

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private SecurityUtils securityUtils;

  @Autowired
  private JobRepository jobRepository;

  @PostMapping
  public ResponseEntity createItem(@RequestBody Item item){
    item.setStatus(ItemStatus.TO_BE_DELIVERED);
    itemRepository.save(item);
    return ResponseEntity.ok(item);
  }

  @GetMapping
  public ResponseEntity<List<Item>> getItems(){
    if(userRepository.findByUsername(securityUtils.getLoggedInUsername()).getRole().equals("ROLE_ADMIN")){
      return ResponseEntity.ok(itemRepository.findAll());
    }
    return ResponseEntity.ok(itemRepository.findByStatus(ItemStatus.TO_BE_DELIVERED)
            .stream()
            .filter(items -> {
              return !items.getSource().getOwner().getUsername().equals(securityUtils.getLoggedInUsername());
            })
            .collect(Collectors.toList()));
  }

  @PutMapping
  public ResponseEntity<Item> updateItem(@RequestParam(required = true) long id,
                                   @RequestParam(required = false) String property,
                                   @RequestParam(required = false) String destination,
                                   @RequestParam(required = false) ItemStatus status){
    Optional<Item> dbItem = itemRepository.findById(id);
    if(dbItem.isEmpty())
      return ResponseEntity.badRequest().build();
    Item updateItem = dbItem.get();
    if (property != null)
      updateItem.setProperties(property);
    if (destination != null)
      updateItem.setDestination(destination);
    if (status != null)
      updateItem.setStatus(status);
    return ResponseEntity.ok(itemRepository.save(updateItem));
  }

  @DeleteMapping("/{id}")
  public ResponseEntity deleteItem(@PathVariable Long id){
    if(securityUtils.getLoggedInUserAuthorities().equals("ROLE_ADMIN")){
      Optional<Item> item = itemRepository.findById(id);
      if(item.isPresent()) {
        jobRepository.delete(jobRepository.findByItem(item.get()));
        itemRepository.delete(item.get());
        return ResponseEntity.ok().build();
      }
    }
    return ResponseEntity.badRequest().build();
  }
}
