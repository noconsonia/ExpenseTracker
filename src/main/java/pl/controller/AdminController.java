package pl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.entity.User;
import pl.repository.SecurityService;
import pl.repository.UserRepository;
import pl.repository.UserService;
import pl.repository.UserValidator;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final UserRepository userRepository;
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

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
            return "registration";
        }

        userService.save(user);

        securityService.autoLogin(user.getUsername(), user.getPasswordConfirm());

        return "redirect:/all";
    }


    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String showAllUsers() {
        return "userlist";
    }

    @ModelAttribute("users")
    public List<User> allUser() {
        return userRepository.findAll();
    }


}
