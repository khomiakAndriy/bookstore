package ua.bookstore.service;

import ua.bookstore.entity.Book;
import ua.bookstore.entity.Order;

import java.util.List;

public interface OrderService {
    public List<Order> getAll();

    public List<Order> getByUserEmail(String email);

    public Order save(Order order);

    public void remove(int id);

    public Order get(int id);

    public Order createOrder(String email, String address);

    public void changeStatus(Integer id);
}
