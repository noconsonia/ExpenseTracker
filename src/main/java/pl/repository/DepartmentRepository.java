package pl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.entity.Department;

public interface DepartmentRepository extends JpaRepository<Department, Integer> {
    Department findFirstById(int departmentId);
}
