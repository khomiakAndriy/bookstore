package ua.bookstore.dao;

import ua.bookstore.entity.User;

import java.util.List;

public interface UserDao {

    public List<User> getAll();

    public User save(User user);

    public void remove(int id);

    public User get(int id);

    public User getByEmail(String email);

    public boolean userExists(String email);
}
