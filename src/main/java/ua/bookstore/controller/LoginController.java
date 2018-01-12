package ua.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/showLoginPage")
    public String showLoginForm(){
        return "login-page";
    }

    @GetMapping("/access-denied")
    public String showError(){
        return "error-page";
    }
}
