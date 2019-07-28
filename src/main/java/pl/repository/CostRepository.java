package pl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.entity.Cost;

public interface CostRepository extends JpaRepository<Cost, Long> {



}
