package pl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.entity.Mpk;

public interface MpkRepository extends JpaRepository<Mpk, Integer> {

    Mpk findFirstById(int mpkId);
}
