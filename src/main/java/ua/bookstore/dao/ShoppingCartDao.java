package ua.bookstore.dao;

import ua.bookstore.entity.Book;
import ua.bookstore.entity.ShoppingCart;

import java.util.List;

public interface ShoppingCartDao {

    public ShoppingCart save(ShoppingCart shoppingCart);

    public void remove(int id);

    public ShoppingCart get(int id);

    public ShoppingCart getByUserEmail(String email);

}
