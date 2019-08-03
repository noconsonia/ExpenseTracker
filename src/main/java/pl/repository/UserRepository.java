
package pl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.entity.User;

@Repository("userRepository")


public interface UserRepository extends JpaRepository<User, Integer> {

     User findByUsername(String username);

}

