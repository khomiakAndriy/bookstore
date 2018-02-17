package ua.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ua.bookstore.entity.Book;
import ua.bookstore.entity.CartItem;
import ua.bookstore.entity.ShoppingCart;
import ua.bookstore.entity.User;
import ua.bookstore.service.BookService;
import ua.bookstore.service.CartItemService;
import ua.bookstore.service.ShoppingCartService;
import ua.bookstore.service.UserService;

import java.math.BigDecimal;
import java.security.Principal;

@Controller
@RequestMapping("/shoppingCart")
public class CartItemController {

    @Autowired
    private CartItemService cartItemService;

    @Autowired
    private ShoppingCartService shoppingCartService;


    @RequestMapping("/addBook/{bookId}")
    public String addBookToCartItem(@PathVariable(value = "bookId") Integer bookId, Model model, Principal principal,
    @ModelAttribute("qty") String qty){

        cartItemService.addBookToShoppingCart(principal.getName(), bookId, Integer.valueOf(qty));

//
//        Book book = bookService.get(bookId);
//        CartItem cartItem = new CartItem();
//        cartItem.setQty(Integer.valueOf(qty));
//        cartItem.setBook(book);
//        cartItem.setAmount(book.getPrice().multiply(new BigDecimal(Integer.valueOf(qty))));
//
//        User user = userService.getByEmail(principal.getName());
//        ShoppingCart shoppingCart = user.getShoppingCart();
//
//        if (shoppingCart==null){
//            shoppingCart = new ShoppingCart();
//            shoppingCart.setTotalAmount(BigDecimal.valueOf(0));
//            shoppingCart.setUser(user);
//            user.setShoppingCart(shoppingCart);
//            userService.save(user);
//            shoppingCart = userService.getByEmail(principal.getName()).getShoppingCart();
//        }
//        cartItem.setShoppingCart(shoppingCart);
//        cartItemService.save(cartItem);

        model.addAttribute("bookAdded", true);
        return "forward:/book/info/"+bookId;
    }

    @RequestMapping("/deleteCartItem/{cartItemId}")
    public String deleteCartItem(@PathVariable(value = "cartItemId") Integer cartItemId, Principal principal){
        CartItem cartItem = cartItemService.get(cartItemId);
        ShoppingCart shoppingCart = shoppingCartService.getByUserEmail(principal.getName());
        shoppingCart.setTotalAmount(shoppingCart.getTotalAmount().subtract(cartItem.getAmount()));
        shoppingCartService.save(shoppingCart);
        cartItemService.remove(cartItemId);
        return "forward:/shoppingCart/";
    }
}
