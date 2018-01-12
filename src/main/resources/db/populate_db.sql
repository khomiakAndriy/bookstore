DELETE FROM roles;
DELETE FROM users;

INSERT INTO users (name, email, password, phone, address) VALUES
  ('User', 'user@gmail.com', 'user', '+38063-000-00-00', 'Lviv'),
  ('Admin', 'admin@gmail.com', 'admin', '+38063-000-00-01', 'Odesa');

INSERT INTO roles (role, user_id) VALUES
  ('ROLE_USER', 100000),
  ('ROLE_ADMIN', 100001),
  ('ROLE_USER', 100001);