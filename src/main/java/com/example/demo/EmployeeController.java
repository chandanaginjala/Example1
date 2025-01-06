package com.example.demo;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class EmployeeController {

    Logger log = Logger.getAnonymousLogger();

    @Autowired
    EmployeeService service;

    // Insert Data
    @RequestMapping("/insert")
    public ModelAndView insertData(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView();
        Employee e = new Employee();
        e.setEname(req.getParameter("ename"));
        e.setPhono(req.getParameter("phono"));

        // Inserting employee and checking if it's successful
        if (service.insert(e) != null) {
            mv.setViewName("insertSuccess.jsp"); // Success view
        } else {
            mv.setViewName("insertFailure.jsp"); // Failure view
        }
        return mv;
    }

    // Get All Employees
    @RequestMapping("/getall")
    public ModelAndView getData(HttpServletRequest req, HttpServletResponse res) {
        ModelAndView mv = new ModelAndView();
        List<Employee> list = service.getAll();
        mv.setViewName("empdisplay.jsp");
        mv.addObject("list", list); // Add list of employees to the view
        return mv;
    }

    // Show the Update Form (GET method)
    @RequestMapping("/update/{id}")
    public ModelAndView showUpdateForm(@PathVariable("id") int id) {
        ModelAndView mv = new ModelAndView();
        Employee employee = service.getEmployeeById(id);  // Retrieve employee by id
        mv.setViewName("updateForm.jsp");
        mv.addObject("employee", employee); // Add employee to the view
        return mv;
    }

    // Process the Update (POST method)
    @PostMapping("/update")
    public String updateEmployee(@ModelAttribute("employee") Employee employee, Model model) {
        Employee updatedEmployee = service.updateByName(employee);
        model.addAttribute("employee", updatedEmployee); // Add updated employee to model
        return "employeeDetails.jsp"; // Display updated employee details
    }

    // Delete an Employee by ID
    @RequestMapping("/delete/{id}")
    public ModelAndView deleteById(@PathVariable("id") String id) {
        ModelAndView mv = new ModelAndView();
        log.info("Deleting employee with ID: " + id);
        List<Employee> employees = service.deleteById(Integer.parseInt(id)); // Delete employee by ID
        mv.setViewName("empdisplay.jsp");
        mv.addObject("list", employees); // Update the list of employees in the view
        return mv;
    }
}
