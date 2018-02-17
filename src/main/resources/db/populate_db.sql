DELETE FROM roles;
DELETE FROM users;
DELETE FROM books;

INSERT INTO users (name, email, password, phone, address) VALUES
  ('User', 'user@gmail.com', 'user', '+38063-000-00-00', 'Lviv'),
  ('Admin', 'admin@gmail.com', 'admin', '+38063-000-00-01', 'Odesa');

INSERT INTO roles (role, user_id) VALUES
  ('ROLE_USER', 100000),
  ('ROLE_ADMIN', 100001),
  ('ROLE_USER', 100001);

INSERT INTO books (title, author, price, isbn, description) VALUES
('Kod Da Vinchi', 'Dan Braun', 32.58, 'B00C4XSS1O', 'The Da Vinci Code is a 2003 mystery thriller novel by Dan Brown. It follows symbologist Robert Langdon and cryptologist Sophie Neveu after a murder in the Louvre Museum in Paris causes them to become involved in a battle between the Priory of Sion and Opus Dei over the possibility of Jesus Christ having been a companion to Mary Magdalene.'),
('Inferno', 'Dan Braun', 45.99, '978-1400079155', 'Harvard professor of symbology Robert Langdon awakens in an Italian hospital, disoriented and with no recollection of the past thirty-six hours, including the origin of the macabre object hidden in his belongings. With a relentless female assassin trailing them through Florence, he and his resourceful doctor, Sienna Brooks, are forced to flee.'),
('Catching Fire', 'Suzanne Collins', 25.12, '978-0545586177', 'Against all odds, Katniss Everdeen has won the annual Hunger Games with fellow district tribute Peeta Mellark. But it was a victory won by defiance of the Capitol and their harsh rules. Katniss and Peeta should be happy. After all, they have just won for themselves and their families a life of safety and plenty. But there are rumors of rebellion among the subjects, and Katniss and Peeta, to their horror, are the faces of that rebellion.'),
('The Hideaway', ' Lauren K. Denton', 37.19, '978-0718084226', 'After her last remaining family member dies, Sara Jenkins goes home to The Hideaway, her grandmother Mags’s ramshackle B&B in Sweet Bay, Alabama. She intends to quickly tie up loose ends then return to her busy life and thriving antique shop in New Orleans. Instead, she learns Mags has willed.');