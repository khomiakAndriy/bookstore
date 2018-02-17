package ua.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.bookstore.entity.CartItem;
import ua.bookstore.entity.ShoppingCart;
import ua.bookstore.entity.User;
import ua.bookstore.service.CartItemService;
import ua.bookstore.service.ShoppingCartService;
import ua.bookstore.service.UserService;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/shoppingCart")
public class ShoppingCartController {

    @Autowired
    private UserService userService;

    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    private CartItemService cartItemService;

    @RequestMapping("/")
    public String showShoppingCart(Model model, Principal principal){
        ShoppingCart shoppingCart = shoppingCartService.getByUserEmail(principal.getName());
        User user = userService.getByEmail(principal.getName());
        List<CartItem> cartItems = cartItemService.getCartItemsByUserEmail(principal.getName());


        if (cartItems.size()==0){
            model.addAttribute("emptyShoppingCart", true);
        }
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("shoppingCart", shoppingCart);
        model.addAttribute("user", user);
        return "shopping-cart";
    }
}
