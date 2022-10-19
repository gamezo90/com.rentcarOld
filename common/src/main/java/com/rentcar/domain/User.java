package com.rentcar.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.rentcar.domain.Gender;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NamedQuery;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.sql.Timestamp;
import java.util.Set;

@Data
@Entity
@EqualsAndHashCode(exclude = {
        "roles", "orders", "info"
})
@ToString(exclude = {
        "roles", "orders", "info"
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

    /*wadwada*/
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

//    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
//    @ManyToMany(mappedBy = "users", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
//    @JsonIgnoreProperties("users")
//    private Set<HibernateRole> roles;
//
//    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
//    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
//    @JsonManagedReference
//    private Set<HibernateShopOrder> orders;
//
//    @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
//    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = true)
//    @JsonManagedReference
//    private HibernateMedicalInfo info;

}
