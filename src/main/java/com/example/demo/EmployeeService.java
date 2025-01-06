package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository repository;

    // Insert a new employee
    public Employee insert(Employee employee) {
        return repository.save(employee);
    }

    // Get all employees
    public List<Employee> getAll() {
        return repository.findAll();
    }

    // Get an employee by ID
    public Employee getEmployeeById(int id) {
        Optional<Employee> optionalEmployee = repository.findById(id);
        return optionalEmployee.orElse(null); // Return null if not found
    }

    // Update an employee by their details
    public Employee updateByName(Employee updatedEmployee) {
        Optional<Employee> optionalEmployee = repository.findById(updatedEmployee.getEid());
        if (optionalEmployee.isPresent()) {
            Employee existingEmployee = optionalEmployee.get();
            existingEmployee.setEname(updatedEmployee.getEname());
            existingEmployee.setPhono(updatedEmployee.getPhono());
            return repository.save(existingEmployee); // Save and return updated employee
        }
        return null; // Return null if employee not found
    }

    // Delete an employee by ID
    public List<Employee> deleteById(int id) {
        repository.deleteById(id);
        return repository.findAll(); // Return the updated list of employees
    }
}
