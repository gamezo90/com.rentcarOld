package com.rentcar.domain;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import javax.persistence.*;

@Data
@Entity
@Table(name = "credentials")

public class Credentials {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_login")
    private String userLogin;

    @Column(name = "user_password")
    private String userPassword;

    @Column(name = "user_email")
    private String userEmail;

    @OneToOne
    @JoinColumn(name = "user_id")
    @JsonBackReference
    private User user;
}