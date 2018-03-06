package com.elka.pw.eiti.auth.controller;

import com.elka.pw.eiti.auth.entity.User;
import com.elka.pw.eiti.auth.service.SecurityService;
import com.elka.pw.eiti.auth.service.UserDetailsService;
import com.elka.pw.eiti.auth.service.UserDetailsServiceImpl;
import com.elka.pw.eiti.auth.service.UserService;
import com.elka.pw.eiti.auth.validator.UserValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");


        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model)
    {
        UserDetailsServiceImpl userDetailsService =  new UserDetailsServiceImpl();
        UserDetails userDetails  = userDetailsService.getLoggedUser();

        System.out.println("xxx: "+userDetails.toString());

        User user = User.builder().
                name("Janusz").
                lastName("Korwin-Mikke").
                build();
        model.addAttribute("user",user);

        return "welcome";
    }
}