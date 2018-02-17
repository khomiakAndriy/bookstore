package ua.bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ua.bookstore.entity.CartItem;
import ua.bookstore.entity.Order;
import ua.bookstore.service.CartItemService;
import ua.bookstore.service.OrderService;

import java.math.BigDecimal;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.List;


@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private CartItemService cartItemService;

    @RequestMapping("/preOrder/")
    public String preOrder(Principal principal, Model model){
        List<CartItem> cartItems = cartItemService.getCartItemsByUserEmail(principal.getName());
        BigDecimal totalAmount = cartItems.stream().map(CartItem::getAmount).reduce(BigDecimal.ZERO, BigDecimal::add);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("totalAmount", totalAmount);
        return "pre-order";
    }

    @RequestMapping("/createOrder/")
    public String createOrder(Principal principal, @ModelAttribute("address") String address, Model model){
        System.out.println(address);
        Order order = orderService.createOrder(principal.getName(), address);
        model.addAttribute("order", order);
        model.addAttribute("localDateTimeFormat",  new SimpleDateFormat("yyyy-MM-dd"));
        return "order-success";
    }
    @RequestMapping("/showOrder/{orderId}")
    public String showOrderInfo(@PathVariable(value = "orderId") Integer id, Model model){
        Order order = orderService.get(id);
        model.addAttribute("order", order);
        model.addAttribute("adminPage", true);
        model.addAttribute("localDateTimeFormat",  new SimpleDateFormat("yyyy-MM-dd"));
        return "order-success";
    }

    @RequestMapping("/deleteOrder/{orderId}")
    public String deleteOrder(@PathVariable(value = "orderId") Integer id){
        orderService.remove(id);
        return "redirect:/admin/orders";
    }

    @RequestMapping("/changeStatus/{orderId}")
    public String changeStatus(@PathVariable(value = "orderId") Integer id){
        orderService.changeStatus(id);
        return "redirect:/admin/orders";
    }
}
