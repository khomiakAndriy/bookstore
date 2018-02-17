package ua.bookstore.controller;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ua.bookstore.entity.Book;
import ua.bookstore.entity.Order;
import ua.bookstore.entity.Role;
import ua.bookstore.entity.User;
import ua.bookstore.service.BookService;
import ua.bookstore.service.OrderService;
import ua.bookstore.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger LOGGER = Logger.getLogger(AdminController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private BookService bookService;

    @GetMapping("/")
    public String adminPage() {
        return "admin-page";
    }

    @GetMapping("/books")
    public String showBooks(Model model) {
        List<Book> books = bookService.getAll();
        model.addAttribute("books", books);
        return "book-list";
    }

    @GetMapping("/orders")
    public String showOrders(Model model) {
        List<Order> orders = orderService.getAll();
        model.addAttribute("orders", orders);
        model.addAttribute("localDateTimeFormat",  new SimpleDateFormat("yyyy-MM-dd"));
        return "orders-list";
    }



    @GetMapping("/delete")
    public String removeUser(@RequestParam("userId") int id) {
        userService.remove(id);
        return "redirect:/users";
    }

    @GetMapping("/book/delete")
    public String removeBook(@RequestParam("bookId") int id) {
        bookService.remove(id);
        return "redirect:/admin/books";
    }

    @GetMapping("/book/update")
    public String updateBook(@RequestParam("bookId") int id, Model model) {
        Book book = bookService.get(id);
        model.addAttribute("book", book);
        return "book-form";
    }

    @PostMapping(value = "/book/saveBook")
    public String addBook(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpServletRequest request) {
        if (result.hasErrors()) {
            return "book-form";
        }
        bookService.save(book);

        MultipartFile bookImage = book.getBookImage();

        // unfortunately I can't find solution witch allow me do not hardcode path for uploading images
        if (bookImage != null && !bookImage.isEmpty()) {
            String name = book.getId() + ".jpg";
            try {
                byte[] bytes = bookImage.getBytes();
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(new File("e:/Andriy/tmp/bookstore/src/main/webapp/resources/img/" + name)));
                stream.write(bytes);
                stream.close();
            } catch (Exception e) {
                LOGGER.warn("Image wasn't saved "+name);
            }
        }
        return "redirect:/admin/books";
    }

    @GetMapping("/book/addBook")
    public String addBook(Model model) {
        Book book = new Book();
        model.addAttribute("book", book);
        return "book-form";
    }

    @GetMapping("/update")
    public String updateUser(@RequestParam("userId") int id, Model model) {
        User user = userService.get(id);
        model.addAttribute("user", user);
        return "update-user";
    }

}
