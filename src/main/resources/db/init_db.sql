DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS cart_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS shopping_carts;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
  id       INT(10)                 NOT NULL AUTO_INCREMENT,
  name     VARCHAR(100)            NOT NULL,
  email    VARCHAR(100)            NOT NULL,
  phone    VARCHAR(100)            NOT NULL,
  password VARCHAR(100)            NOT NULL,
  address  VARCHAR(100)            NOT NULL,
  enabled  BOOL DEFAULT TRUE       NOT NULL,
  PRIMARY KEY (id)
)
  AUTO_INCREMENT = 100000;

CREATE UNIQUE INDEX users_unique_email_idx
  ON users (email);

CREATE TABLE roles
(
  user_id INTEGER(10) NOT NULL,
  role    VARCHAR(100),
  CONSTRAINT user_roles_idx UNIQUE (user_id, role),
  FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE books (
  id          INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
  title       VARCHAR(100)   NOT NULL,
  author      VARCHAR(100)   NOT NULL,
  price       DECIMAL(10, 2) NOT NULL,
  isbn        VARCHAR(20)    NOT NULL,
  description VARCHAR(500)   NOT NULL
)
  AUTO_INCREMENT = 100000;

CREATE UNIQUE INDEX books_unique_isbn_idx
  ON books (isbn);

CREATE TABLE shopping_carts
(
  id      INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
  user_id INTEGER(10),
  amount  DECIMAL(10, 2),
  FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE
)
  AUTO_INCREMENT = 100000;

CREATE TABLE orders
(
  id              INTEGER(10) AUTO_INCREMENT PRIMARY KEY,
  user_id         INTEGER(10),
  shipping_address VARCHAR(100),
  date_time       TIMESTAMP,
  status          VARCHAR(20),
  amount          DECIMAL(10, 2),
  FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE
);

CREATE TABLE cart_items
(
  id               INTEGER(10) PRIMARY KEY AUTO_INCREMENT,
  book_id          INTEGER(10),
  shopping_cart_id INTEGER(10),
  order_id         INTEGER(10),
  qty              INTEGER(10),
  amount           DECIMAL(10, 2),
  FOREIGN KEY (book_id) REFERENCES books (id),
  FOREIGN KEY (order_id) REFERENCES orders (id),
  FOREIGN KEY (shopping_cart_id) REFERENCES shopping_carts (id)
)
  AUTO_INCREMENT = 100000;