package ua.bookstore.dao;

import ua.bookstore.entity.Book;
import ua.bookstore.entity.Order;

import java.util.List;

public interface OrderDao {

    public List<Order> getAll();

    public Order save(Order order);

    public void remove(int id);

    public Order get(int id);

    public List<Order> getByUserEmail(String email);
}
