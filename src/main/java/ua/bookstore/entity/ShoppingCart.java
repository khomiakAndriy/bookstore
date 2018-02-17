package ua.bookstore.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@NamedQueries(
        @NamedQuery(name = ShoppingCart.GET_BY_USER_EMAIL,
                query = "select shc from ShoppingCart shc where shc.user=(select u from User u where u.email=:email)")
)

@Entity
@Table(name = "shopping_carts")
public class ShoppingCart extends AbstractEntity {

    public static final String GET_BY_USER_EMAIL = "ShoppingCart.getByUserEmail";

    @Column(name = "amount")
    private BigDecimal totalAmount = BigDecimal.valueOf(0);

    @OneToOne(cascade = CascadeType.ALL)
    private User user;

    @OneToMany(mappedBy = "shoppingCart",
    cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private List<CartItem> cartItemList;

    public List<CartItem> getCartItemList() {
        return cartItemList;
    }

    public void setCartItemList(List<CartItem> cartItemList) {
        this.cartItemList = cartItemList;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "ShoppingCart{" +
                "totalAmount=" + totalAmount +
                ", user=" + user +
                ", id=" + id +
                '}';
    }
}
