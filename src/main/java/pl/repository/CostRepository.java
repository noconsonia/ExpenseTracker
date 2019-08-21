package pl.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.entity.Cost;

import java.util.List;

public interface CostRepository extends JpaRepository<Cost, Integer> {

    Cost findFirstById(int costId);

    Cost deleteById(int costId);

    @Query(value = "select name, sum(amount) from cost inner join department where department.id = department_id group by department.name", nativeQuery = true)
    List <Object[]> getGroupByDepartment();


    @Query(value = "select name, sum(amount) from cost inner join client where client.id = client_id group by client.name", nativeQuery = true)
    List <Object[]> getGroupByClient();

    @Query(value = "select code, sum(amount) from cost inner join mpk where mpk.id = mpk_id group by mpk.code", nativeQuery = true)
    List <Object[]> getGroupByMpk();
}

