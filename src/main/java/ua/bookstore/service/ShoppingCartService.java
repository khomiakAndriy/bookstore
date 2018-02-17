package ua.bookstore.service;

import ua.bookstore.entity.Book;
import ua.bookstore.entity.ShoppingCart;

import java.util.List;

public interface ShoppingCartService {

    public ShoppingCart save(ShoppingCart shoppingCart);

    public void remove(int id);

    public ShoppingCart get(int id);

    public ShoppingCart getByUserEmail(String email);
}
