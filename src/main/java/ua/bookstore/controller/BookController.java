package ua.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.bookstore.entity.Book;
import ua.bookstore.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/info/{bookId}")
    public String bookInfo(@PathVariable(value = "bookId") int id, Model model){
        Book book = bookService.get(id);
        model.addAttribute("book", book);
        return "book-info";
    }
}
