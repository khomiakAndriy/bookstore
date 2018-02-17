package ua.bookstore.dao;

import org.springframework.stereotype.Repository;
import ua.bookstore.entity.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<User> getAll() {
        return em.createNamedQuery(User.GET_ALLSORTED, User.class).getResultList();
    }

    @Override
    public User save(User user) {
        if (user.isNew()){
            em.persist(user);
            return user;
        } else {
            return em.merge(user);
        }
    }

    @Override
    public void remove(int id) {
        User user = em.getReference(User.class, id);
        em.remove(user);
    }

    @Override
    public User get(int id) {
        return em.find(User.class, id);
    }

    @Override
    public User getByEmail(String email) {
        return em.createNamedQuery(User.GET_BY_EMAIL, User.class).setParameter("email", email).getSingleResult();
    }

    @Override
    public boolean userExists(String email) {
        return em.createNamedQuery(User.GET_BY_EMAIL, User.class).setParameter("email", email).getResultList().size() == 1;
    }


}
