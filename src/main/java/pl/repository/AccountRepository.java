package pl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.entity.Account;

public interface AccountRepository extends JpaRepository<Account, Long> {
}
