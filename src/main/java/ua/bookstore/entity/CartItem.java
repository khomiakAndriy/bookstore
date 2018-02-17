package ua.bookstore.entity;

import javax.persistence.*;
import javax.validation.constraints.Min;
import java.math.BigDecimal;

@NamedQueries(
        @NamedQuery(name = CartItem.GET_CART_ITEMS_BY_USER,
                query = "select ci from CartItem ci where ci.shoppingCart=(select sc from ShoppingCart sc where sc.user =(select u from User u where u.email=:email))")
)

@Entity
@Table(name = "cart_items")
public class CartItem extends AbstractEntity {

    public static final String GET_CART_ITEMS_BY_USER = "CartItem.getCartItemsByUserEmail";

    @Min(value = 1)
    @Column(name = "qty")
    private Integer qty;

    @Column(name = "amount")
    private BigDecimal amount;

    @OneToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name = "book_id")
    private Book book;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name = "order_id")
    private Order order;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name = "shopping_cart_id")
    private ShoppingCart shoppingCart;

    public ShoppingCart getShoppingCart() {
        return shoppingCart;
    }

    public void setShoppingCart(ShoppingCart shoppingCart) {
        this.shoppingCart = shoppingCart;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "qty=" + qty +
                ", book=" + book +
                ", id=" + id +
                '}';
    }
}
