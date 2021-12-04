package com.bogyo.freelancer.repository;

import com.bogyo.freelancer.model.Item;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ItemRepository extends JpaRepository<Item,Long>, JpaSpecificationExecutor<Item> {
    List<Item> findByproperties(String property);

    List<Item> findByStatus(String status);
}
