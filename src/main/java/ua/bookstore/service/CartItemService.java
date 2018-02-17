package ua.bookstore.service;

import ua.bookstore.entity.CartItem;

import java.util.List;

public interface CartItemService {

    public CartItem save(CartItem cartItem);

    public void remove(int id);

    public CartItem get(int id);

    public void addBookToShoppingCart(String name, Integer bookId, Integer integer);

    public List<CartItem> getCartItemsByUserEmail(String userEmail);
}
