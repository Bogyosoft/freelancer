package com.bogyo.freelancer.repository;

import com.bogyo.freelancer.model.Job;
import com.bogyo.freelancer.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface JobRepository extends JpaRepository<Job,Long>, JpaSpecificationExecutor<Job> {
    List<Job> findByfreelancer(User freelancer);
}

