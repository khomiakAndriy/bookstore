package ua.bookstore.service;

import ua.bookstore.entity.User;

import java.util.List;

public interface UserService {
    public List<User> getAll();

    public User save(User user);

    public boolean userExists(String email);

    public User get(int id);
}
