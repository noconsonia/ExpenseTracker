package pl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.entity.ConfirmationToken;

public interface ConfirmationTokenRepository extends JpaRepository<ConfirmationToken, String> {
    ConfirmationToken findByConfirmationToken(String confirmationToken);
}