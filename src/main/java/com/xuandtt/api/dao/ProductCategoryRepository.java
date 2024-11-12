package com.xuandtt.api.dao;

import com.xuandtt.api.entity.ProductCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductCategoryRepository extends JpaRepository<ProductCategory, Long> {
    ProductCategory findProductCategoryByCategoryNameIsIgnoreCase(String categoryName);

    @Query(value = "select c.category_name from product_category c", nativeQuery = true)
    List<String> getCategoryName();
}
