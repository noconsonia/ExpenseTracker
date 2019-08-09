package pl.entity;


import javax.persistence.*;
import javax.validation.constraints.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;



@Entity
@Table(name = "cost")
public class Cost {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    private Account account;

    @NotNull(message = "Please enter a value")
    @Digits(integer = 16, fraction = 2, message = "Invalid format. Proper format: ######.##")
    private BigDecimal amount;


    @ManyToOne
    private Client client;

    @Pattern(regexp = "(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\\d\\d",
            message = "Invalid format. Proper format: MM/DD/YYYY")
    @NotBlank(message = "Please enter a date")
    private String salesDate;

    @ManyToOne
    private Mpk mpk;

    @Size(min = 1, max = 150, message = "Please enter a value between 1 and 150")
    private String description;

    @ManyToOne
    private Department department;

    @ManyToOne
    private Payment payment;

    @ManyToOne
    private User user;

    @Size(min = 1, max = 30, message = "Please enter a value between 1 and 30")
    private String invoiceNumber;

    private LocalDateTime created;

    @PrePersist
    public void prePersist() {
        created = LocalDateTime.now();
    }

    // Getters Setters


    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public String getSalesDate() {
        return salesDate;
    }

    public void setSalesDate(String salesDate) {
        this.salesDate = salesDate;
    }

    public Mpk getMpk() {
        return mpk;
    }

    public void setMpk(Mpk mpk) {
        this.mpk = mpk;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
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
