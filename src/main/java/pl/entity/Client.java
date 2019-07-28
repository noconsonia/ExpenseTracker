package pl.entity;


import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.pl.NIP;

import javax.persistence.*;

@Entity
@Table(name = "client")
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank
    private String name;

    @NotBlank
    @NIP
    private String nip;

}
