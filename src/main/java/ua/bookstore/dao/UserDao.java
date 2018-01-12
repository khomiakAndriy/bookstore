package ua.bookstore.dao;

import ua.bookstore.entity.User;

import java.util.List;

public interface UserDao {

    public List<User> getAll();

    public User save(User user);

    public User get(int id);

    public boolean userExists(String email);
}
