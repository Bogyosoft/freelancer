package com.bogyo.freelancer.repository;

import com.bogyo.freelancer.model.Source;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface SourceRepository extends JpaRepository<Source,Long>, JpaSpecificationExecutor<Source> {
}

