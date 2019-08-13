package pl.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "mpk")
public class Mpk {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String code;

    @OneToMany(mappedBy = "mpk", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    private List<Cost> cost = new ArrayList<>();


    // Getters Setters


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public List<Cost> getCost() {
        return cost;
    }

    public void setCost(List<Cost> cost) {
        this.cost = cost;
    }
}
