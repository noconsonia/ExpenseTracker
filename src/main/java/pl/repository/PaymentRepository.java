package pl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.entity.Payment;

public interface PaymentRepository extends JpaRepository<Payment, Long> {
}
