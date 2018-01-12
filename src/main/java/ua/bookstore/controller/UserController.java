package ua.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import ua.bookstore.entity.Role;
import ua.bookstore.entity.User;
import ua.bookstore.service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }

    @GetMapping("/users")
    public String getAllUsers(Model model) {
        List<User> users = userService.getAll();
        model.addAttribute("users", users);
        return "user-list";
    }

    @GetMapping("/addUser")
    public String addUser(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register-form";
    }

    @PostMapping("/saveUser")
    public String addUser(@Valid @ModelAttribute("user") User user, BindingResult result) {
        if (result.hasErrors()){
            return "register-form";
        }
        user.setRoles(Role.ROLE_USER);
        user.setEmail(user.getEmail().toLowerCase());
        if(userService.userExists(user.getEmail())){
            result.rejectValue("email","DublicateKey.user.email", "User with such email exist");
            return "register-form";
        }
        userService.save(user);
        return "redirect:/users";
    }
}
