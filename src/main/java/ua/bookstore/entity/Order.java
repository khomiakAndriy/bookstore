package ua.bookstore.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@NamedQueries({
        @NamedQuery(name = Order.GET_ALLSORTED, query = "select o from Order o order by o.id desc "),
        @NamedQuery(name = Order.GET_BY_EMAIL, query = "select o from Order o where o.user=(select u from User u where u.email=:email) ")
})

@Entity
@Table(name = "orders")
public class Order extends AbstractEntity {

    public static final String GET_ALLSORTED = "Order.getAll";
    public static final String GET_BY_EMAIL = "Order.getByEmail";

    @NotBlank(message = "Must not be null")
    @Column(name = "shipping_address")
    private String shippingAddress;

    @Column(name = "date_time")
    private LocalDateTime dateTime;

    @Column(name = "status")
    private String status = "new";

    @Column(name = "amount")
    private BigDecimal totalAmount;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private User user;

    @OneToMany(mappedBy = "order",cascade = CascadeType.ALL)
    private List<CartItem> cartItems;

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAdress) {
        this.shippingAddress = shippingAdress;
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

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }



    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", shippingAdress='" + shippingAddress + '\'' +
                ", amount=" + totalAmount +
                ", user=" + user +
                '}';
    }
}
