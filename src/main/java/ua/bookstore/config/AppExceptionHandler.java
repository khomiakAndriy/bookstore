package ua.bookstore.config;

import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
public class AppExceptionHandler {

    @ExceptionHandler(DataAccessException.class)
    public String showErrorPage(Model model){
        model.addAttribute("hasDataAccessException",true);
        return "error";
    }

    @ExceptionHandler(Exception.class)
    public String showErrorPage(){
        return "error";
    }
}
