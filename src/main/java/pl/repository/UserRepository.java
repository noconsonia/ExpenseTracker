
package pl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.entity.User;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {
     User findByUsername(String username);


     @Query(value = "select * from user inner join user_role on user.id = users_id", nativeQuery = true)
     List<User> findByUserWithRole();

     @Modifying
     @Query("update User u set u.password = :password where u.id = :id")
     void updatePassword(@Param("password") String password, @Param("id") int id);

}