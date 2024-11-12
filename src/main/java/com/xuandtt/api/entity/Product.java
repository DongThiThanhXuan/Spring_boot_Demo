package com.xuandtt.api.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name="product")
@Getter
@Setter
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @Column(name="name")
    private String name;

    @Column(name="description")
    private String description;

    @Column(name="unit_price")
    private BigDecimal unitPrice;

    @Column(name="image_url")
    private String imageUrl;

    @Column(name="brand")
    private String brand;

    @Column(name="units_in_stock")
    private int unitsInStock;

    @Column(name="date_created")
    // Hibernate will auto manage the timestamp
    @CreationTimestamp
    private Date dateCreated;

    @Column(name="last_updated")
    // Hibernate will auto manage the timestamp
    @UpdateTimestamp
    private Date lastUpdated;

    @ManyToOne
    @JoinColumn(name = "category_id") // , nullable = false
    // @JsonIgnore /// preventing infinity JSON loop
    private ProductCategory category;

//    @OneToOne
//    @PrimaryKeyJoinColumn
//    @JsonIgnore
//    private BasketItem basketItem;

    public Product() {
    }

    public Product(String name, String description, BigDecimal unitPrice, String imageUrl, String brand, int unitsInStock, ProductCategory category) {
        this.name = name;
        this.description = description;
        this.unitPrice = unitPrice;
        this.imageUrl = imageUrl;
        this.brand = brand;
        this.unitsInStock = unitsInStock;
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", unitPrice=" + unitPrice +
                ", imageUrl='" + imageUrl + '\'' +
                ", brand='" + brand + '\'' +
                ", unitsInStock=" + unitsInStock +
                ", dateCreated=" + dateCreated +
                ", lastUpdated=" + lastUpdated +
                ", category=" + category +
                '}';
    }
}
