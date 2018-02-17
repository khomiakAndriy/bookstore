package ua.bookstore.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class AppExceptionHandler {

    @ExceptionHandler(Exception.class)
    public String showErrorPage(){
        return "error";
    }
}
