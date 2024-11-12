package com.xuandtt.api.dao;


import com.xuandtt.api.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
//    Page<Product> findAll(Specification<Product> specification, Pageable pageable);
//
//    @Query(value = "select distinct p.brand from product p", nativeQuery = true)
//    List<String> getDistinctBrand();
}