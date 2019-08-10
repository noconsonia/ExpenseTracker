package pl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {


    Role findRoleById(int id);
}
