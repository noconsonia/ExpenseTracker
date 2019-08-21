package pl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.entity.Role;
import pl.entity.User;
import pl.repository.*;
import pl.validation.UserValidator;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final UserRepository userRepository;
    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private RoleRepository roleRepository;


    public AdminController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/adduser")
    public String registration(Model model) {
        model.addAttribute("user", new User());
        return "user";
    }

    @PostMapping("/adduser")
    public String registration(@ModelAttribute("user") User user, BindingResult bindingResult) {
        userValidator.validate(user, bindingResult);

        if (bindingResult.hasErrors()) {
            return "user";
        }
        userService.save(user);
        return "redirect:/admin/all";
    }


    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String showAllUsers() {
        return "userlist";
    }

    @ModelAttribute("users")
    public List<User> allUser() {
        return userRepository.findAll();
    }


    @ModelAttribute("userWithRole")
    public List<Object[]> allUserWithRole() {
        return userRepository.findByUserWithRole();
    }


    @RequestMapping(value = "/delete-user/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable int id) {
        userRepository.deleteById(id);
        return "redirect:/admin/all";
    }

    @ModelAttribute("role")
    public List<Role> allRole() {
        return roleRepository.findAll();
    }


}
