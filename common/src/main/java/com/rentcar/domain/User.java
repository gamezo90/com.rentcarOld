package com.rentcar.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

@Data
@Entity
@EqualsAndHashCode(exclude = {
        "roles", "orders", "credentials", "discount", "cars"
})
@ToString(exclude = {
        "roles", "orders", "credentials", "discount", "cars"
})
@Table(name = "users")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@Cacheable
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_name")
    private String userName;

    @Column
    private String surname;

    @Column(name = " creation_date")
    @JsonIgnore
    private Timestamp creationDate;

    @Column(name = "modification_date")
    @JsonIgnore
    private Timestamp modificationDate;

    @Column(name = "is_banned")
    @JsonIgnore
    private Boolean isBanned;

    @Column(name = "is_deleted")
    @JsonIgnore
    private Boolean isDeleted;

    @Column
    private String region;

    @Column
    @JsonIgnore
    private Timestamp birthday;

    @Column(name = "gender")
    @Enumerated(EnumType.STRING)
    private Gender gender = Gender.NOT_SELECTED;


//    @Embedded
//    @AttributeOverrides({
//            @AttributeOverride(name = "login", column = @Column(name = "user_login")),
//            @AttributeOverride(name = "password", column = @Column(name = "user_password"))
//    })
//    private Credentials credentials;

    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
    @JsonManagedReference
    private Credentials credentials;
//
//    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
//    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
//    @JsonManagedReference
//    private Discount discount;
//
//    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
//    @ManyToMany(mappedBy = "users", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//    @JsonIgnoreProperties("users")
//    private Set<Role> roles;
//
//    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
//    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
//    @JsonManagedReference
//    private Set<Order> orders;
//
//    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
//    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
//    @JsonManagedReference
//    private Set<Car> cars;
}
