package pl.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Entity
@Table(name = "cost")
public class Cost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @OneToOne
    private Account account;

    private BigDecimal amount;

    @OneToOne
    private Client client;

    @OneToOne
    private Mpk mpk;

    @OneToOne
    private Payment payment;

    @OneToOne
    private User user;

    private LocalDateTime salesDate;

    @Size(max = 150)
    private String description;

    @OneToMany(mappedBy = "cost", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Department> department = new ArrayList<>();

    @NotBlank
    @Size(min = 1, max = 30)
    private String invoiceNumber;

    private LocalDateTime created;

    @PrePersist
    public void prePersist() {
        created = LocalDateTime.now();
    }




    // Getter Setters

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Mpk getMpk() {
        return mpk;
    }

    public void setMpk(Mpk mpk) {
        this.mpk = mpk;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDateTime getSalesDate() {
        return salesDate;
    }

    public void setSalesDate(LocalDateTime salesDate) {
        this.salesDate = salesDate;
    }

    public String getDesciption() {
        return description;
    }

    public void setDesciption(String desciption) {
        this.description = desciption;
    }

    public List<Department> getDepartment() {
        return department;
    }

    public void setDepartment(List<Department> department) {
        this.department = department;
    }

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
    }

    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }
}
