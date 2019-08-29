package pl.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.DTO.PasswordResetDto;
import pl.entity.ConfirmationToken;
import pl.entity.User;
import pl.repository.*;
import pl.service.EmailSenderService;
import pl.validation.PasswordResetDtoValidator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ConfirmationTokenRepository confirmationTokenRepository;

    @Autowired
    private EmailSenderService emailSenderService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private PasswordResetDtoValidator passwordResetDtoValidator;




    @ModelAttribute("passwordResetForm")
    public PasswordResetDto passwordReset() {
        return new PasswordResetDto();
    }


    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username or password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }


    @RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
    public String displayResetPassword(Model model) {
        model.addAttribute("user", new User());
        return "forgotPassword";
    }

    @RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
    public String forgotUserPassword(@ModelAttribute("user") @Valid User user, BindingResult result) {

        User existingUser = userRepository.findByUsername(user.getUsername());
        if (existingUser != null) {
            ConfirmationToken confirmationToken = new ConfirmationToken(existingUser);

            confirmationTokenRepository.save(confirmationToken);

            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setTo(existingUser.getUsername());
            mailMessage.setSubject("Complete Password Reset!");
            mailMessage.setFrom("test-email@gmail.com");
            mailMessage.setText("To complete the password reset process, please click here: "
                    + "https://app-expensetracker.herokuapp.com/confirm-reset?token=" + confirmationToken.getConfirmationToken());

            emailSenderService.sendEmail(mailMessage);

            return "successForgotPassword";

        } else if (result.hasErrors()) {
            return "forgotPassword";
        } else if (user == null) {
            return "forgotPassword";
        }
        return "forgotPassword";
    }


    @RequestMapping(value = "/confirm-reset", method = {RequestMethod.GET})
    public String validateResetToken(Model model, @RequestParam("token") String confirmationToken) {
        ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);

        if (token != null) {
            User user = userRepository.findByUsername(token.getUser().getUsername());
            user.getId();
            model.addAttribute("user", user);
        } else {
            model.addAttribute("message", "The link is invalid or broken!");
            model.addAttribute("error");
        }
        return "resetPassword";
    }

    @Transactional
    @RequestMapping(value = "/confirm-reset", method = RequestMethod.POST)
    public String resetUserPassword(@RequestParam("token") String confirmationToken, @Valid @ModelAttribute("passwordResetForm") PasswordResetDto form, BindingResult bindingResult) {


        ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);
        User user = token.getUser();

        passwordResetDtoValidator.validate(form, bindingResult);
        if (bindingResult.hasErrors()) {
            return "resetPassword";
        }

        String updatedPassword = bCryptPasswordEncoder.encode(form.getPassword());
        userService.updatePassword(updatedPassword, user.getId());
        return "redirect:/login";
    }


    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }


    @GetMapping(value = "user/profile")
    public String showinfo(HttpSession session, HttpServletRequest request, ModelMap modelMap) {
        if (request.isUserInRole("ROLE_ADMIN")) {
            return "adminprofile";
        } else {
            return "userprofile";
        }
    }



}
