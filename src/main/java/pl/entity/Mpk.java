package pl.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;


@Entity
@Table(name = "mpk")
public class Mpk {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank
    private String code;

    @OneToOne(mappedBy = "mpk", cascade = CascadeType.ALL)
    private Cost cost;



    // Getters Setters
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Cost getCost() {
        return cost;
    }

    public void setCost(Cost cost) {
        this.cost = cost;
    }
}
