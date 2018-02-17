package ua.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.bookstore.entity.Book;
import ua.bookstore.service.BookService;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private BookService bookService;

    @RequestMapping ("/")
    public String home(Model model){
        List<Book> bookList = bookService.getAll();
        if (bookList.size() == 0){
            model.addAttribute("emptyBookList", true);
        } else {
            model.addAttribute("emptyBookList", false);
            model.addAttribute("bookList", bookList);
        }
        return "home";
    }
}
