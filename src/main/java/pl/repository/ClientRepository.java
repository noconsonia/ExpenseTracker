package pl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.entity.Client;

public interface ClientRepository extends JpaRepository<Client, Integer> {

    Client findFirstById(int accountId);

    Client deleteById(int costId);

}


