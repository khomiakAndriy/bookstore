package ua.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ua.bookstore.entity.Role;
import ua.bookstore.entity.User;
import ua.bookstore.service.UserService;

import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    @GetMapping("/update")
    public String updateUser(@RequestParam("userId") int id, Model model) {
        User user = userService.get(id);
        model.addAttribute("user", user);
        return "update-user";
    }

    @PostMapping("/updateUser")
    public String updateUser(@Valid @ModelAttribute("user") User user, BindingResult result) {
        if (result.hasErrors()){
            return "update-user";
        }
        user.setEmail(user.getEmail().toLowerCase());
        user.setRoles(Role.ROLE_USER);
        userService.save(user);
        return "redirect:/users";
    }
}
