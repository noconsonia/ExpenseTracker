package pl.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "client")
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Size(min = 1, max = 50, message = "Please enter a value between 1 and 50")
    @NotBlank(message = "This field is required.")
    private String name;

    @Size(min = 1, max = 50, message = "Please enter a value between 1 and 50")
    @NotBlank(message = "This field is required.")
    private String nip;

    @OneToMany(mappedBy = "client", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    private List<Cost> cost = new ArrayList<>();


    // Getters Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNip() {
        return nip;
    }

    public void setNip(String nip) {
        this.nip = nip;
    }

    public List<Cost> getCost() {
        return cost;
    }

    public void setCost(List<Cost> cost) {
        this.cost = cost;
    }


}
