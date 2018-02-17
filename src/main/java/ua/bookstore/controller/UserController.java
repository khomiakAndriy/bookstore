package ua.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import ua.bookstore.entity.Order;
import ua.bookstore.entity.Role;
import ua.bookstore.entity.User;
import ua.bookstore.service.OrderService;
import ua.bookstore.service.UserService;

import javax.validation.Valid;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

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

    @GetMapping("/userInfo")
    public String userInfo(Model model, Principal principal) {
        User user = userService.getByEmail(principal.getName());
        model.addAttribute("user", user);
        return "update-user";
    }

    @PostMapping("/saveUser")
    public String addUser(@Valid @ModelAttribute("user") User user, BindingResult result) {
        if (result.hasErrors()){
            return "register-form";
        }
        Set<Role> roles = new HashSet<>();
        roles.add(Role.ROLE_USER);
        user.setRoles(roles);
        user.setEmail(user.getEmail().toLowerCase());
        if(userService.userExists(user.getEmail())){
            result.rejectValue("email","DublicateKey.user.email", "User with such email exist");
            return "register-form";
        }
        userService.save(user);
        return "redirect:/users";
    }

    @PostMapping("/updateUser")
    public String updateUser(@Valid @ModelAttribute("user") User user, BindingResult result) {
        if (result.hasErrors()) {
            return "update-user";
        }
        user.setEmail(user.getEmail().toLowerCase());
        Set<Role> roles = new HashSet<>();
        roles.add(Role.ROLE_USER);
        user.setRoles(roles);
        userService.save(user);
        return "redirect:/";
    }

    @GetMapping("/userOrders")
    public String userOrders(Model model, Principal principal) {
        User user = userService.getByEmail(principal.getName());
        List<Order> orders = orderService.getByUserEmail(principal.getName());
        model.addAttribute("userName", user.getName());
        model.addAttribute("orders", orders);
        return "user-orders-list";
    }
}
