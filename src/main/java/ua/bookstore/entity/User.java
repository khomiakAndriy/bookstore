package ua.bookstore.entity;


import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@NamedQueries({
 @NamedQuery(name = User.GET_ALLSORTED, query = "select u from User u order by u.id asc "),
@NamedQuery(name = User.GET_BY_EMAIL, query = "select u from User u where u.email=:email"),
})

@Entity
@Table(name = "users")
public class User {

    public static final String GET_ALLSORTED = "User.getAll";
    public static final String GET_BY_EMAIL = "User.getByEmail";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotBlank (message = "Must not be null")
    @Size(min = 3, message = "Must be longer than or equal 3")
    @Column(name = "name", nullable = false)
    private String name;

    @NotBlank (message = "Must not be null")
    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @NotBlank (message = "Must not be null")
    @Size(min= 5, message = "Must be longer thaan or equal than 5")
    @Column(name = "password", nullable = false)
    private String password;

    @NotBlank (message = "Must not be null")
    @Column(name = "phone", nullable = false)
    private String phone;

    @NotBlank (message = "Must not be null")
    @Column(name = "address")
    private String address;


    @Column(name = "enabled")
    private boolean enabled = true;

    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "roles", joinColumns = @JoinColumn(name = "user_id"))
    @Column(name = "role")
    @ElementCollection(fetch = FetchType.EAGER)
    private Set<Role> roles = new HashSet();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public boolean isNew(){
        return this.id==null;
    }

    public User() {
    }

    public User(String name, String email, String password, String phone, String address, Role role) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.roles.add(role);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Set<Role> getRoles() {
        return roles;
    }


    public void setRoles(Role role) {
        this.roles.add(role);
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        return id != null ? id.equals(user.id) : user.id == null;
    }

    @Override
    public int hashCode() {
        return id != null ? id.hashCode() : 0;
    }
}
