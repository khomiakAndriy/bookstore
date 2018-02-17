package ua.bookstore.dao;

import ua.bookstore.entity.Book;
import ua.bookstore.entity.CartItem;

import java.util.List;

public interface CartItemDao {

    public CartItem save(CartItem cartItem);

    public void remove(int id);

    public CartItem get(int id);

    public void addBookToShoppingCart(String userEmail, Integer bookId, Integer bookQty);

    public List<CartItem> getCartItemsByUserEmail(String userEmail);
}
