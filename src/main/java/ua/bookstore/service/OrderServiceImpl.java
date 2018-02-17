package ua.bookstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.bookstore.dao.OrderDao;
import ua.bookstore.entity.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private CartItemService cartItemService;

    @Autowired
    private ShoppingCartService shoppingCartService;

    @Autowired
    private UserService userService;

    @Override
    public List<Order> getAll() {
        return orderDao.getAll();
    }

    @Override
    public List<Order> getByUserEmail(String email) {
        return orderDao.getByUserEmail(email);
    }

    @Override
    @Transactional
    public Order save(Order order) {
        return orderDao.save(order);
    }

    @Override
    @Transactional
    public void remove(int id) {
        orderDao.remove(id);
    }

    @Override
    public Order get(int id) {
        return orderDao.get(id);
    }

    @Override
    @Transactional
    public Order createOrder(String userEmail, String address){
        List<CartItem> cartItems = cartItemService.getCartItemsByUserEmail(userEmail);
        Order order = new Order();
        User user = userService.getByEmail(userEmail);
        ShoppingCart shoppingCart = shoppingCartService.getByUserEmail(userEmail);
        order.setShippingAddress(address);
        order.setDateTime(LocalDateTime.now().truncatedTo(ChronoUnit.DAYS));
        save(order);
        order.setUser(user);
        order.setTotalAmount(shoppingCart.getTotalAmount());
        shoppingCart.setTotalAmount(BigDecimal.ZERO);
        shoppingCartService.save(shoppingCart);
        BigDecimal totalAmount = BigDecimal.ZERO;
        for (CartItem cartItem: cartItems){
            cartItem.setShoppingCart(null);
            cartItem.setOrder(order);
            cartItemService.save(cartItem);
        }
        save(order);
        return order;
    }

    @Override
    @Transactional
    public void changeStatus(Integer id) {
        Order order = orderDao.get(id);
        order.setStatus("checked");
        orderDao.save(order);
    }
}
