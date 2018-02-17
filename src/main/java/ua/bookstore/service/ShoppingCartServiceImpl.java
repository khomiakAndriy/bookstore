package ua.bookstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ua.bookstore.dao.ShoppingCartDao;
import ua.bookstore.entity.Book;
import ua.bookstore.entity.ShoppingCart;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class ShoppingCartServiceImpl implements ShoppingCartService {

    @Autowired
    private ShoppingCartDao shoppingCartDao;

    @Override
    @Transactional
    public ShoppingCart save(ShoppingCart shoppingCart) {
        return shoppingCartDao.save(shoppingCart);
    }

    @Override
    @Transactional
    public void remove(int id) {
        shoppingCartDao.remove(id);
    }

    @Override
    public ShoppingCart get(int id) {
        return shoppingCartDao.get(id);
    }

    @Override
    @Transactional
    public ShoppingCart getByUserEmail(String email) {
        return shoppingCartDao.getByUserEmail(email);
    }
}
