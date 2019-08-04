package pl.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.entity.Department;
import pl.repository.DepartmentRepository;

public class DepartmentConverter implements Converter<String, Department> {

    @Autowired
    private DepartmentRepository departmentRepository;

    @Override
    public Department convert(String s) {
        return departmentRepository.findFirstById(Integer.parseInt(s));
    }
}