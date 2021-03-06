package pl.repository;


import pl.entity.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    void updatePassword(String password, int userId);
}