package pl.entity;


import javax.persistence.*;

@Entity
@Table(name = "department")
public class Department {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;

    @ManyToOne
    private Cost cost;



}
