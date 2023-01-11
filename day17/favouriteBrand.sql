
drop table orders;
drop table items;
drop table users;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    join_date DATE,
    favorite_brand VARCHAR(255)
);

CREATE TABLE Items (
    item_id INT PRIMARY KEY,
    item_brand VARCHAR(255)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    item_id INT,
    buyer_id INT,
    seller_id INT,
    FOREIGN KEY (item_id) REFERENCES Items(item_id),
    FOREIGN KEY (buyer_id) REFERENCES Users(user_id),
    FOREIGN KEY (seller_id) REFERENCES Users(user_id)
);



INSERT INTO Users  VALUES (1, DATE '2019-01-01', 'Lenovo');
INSERT INTO Users  VALUES (2, DATE '2019-02-09', 'Samsung');
INSERT INTO Users  VALUES (3, DATE '2019-01-19', 'LG');
INSERT INTO Users  VALUES (4, DATE '2019-05-21', 'HP');


INSERT INTO Items VALUES (1, 'Samsung');
INSERT INTO Items VALUES (2, 'Lenovo');
INSERT INTO Items VALUES (3, 'LG');
INSERT INTO Items VALUES (4, 'HP');


INSERT INTO Orders  VALUES (1, DATE '2019-08-01', 4, 1, 2);
INSERT INTO Orders  VALUES (2, DATE '2019-08-02', 2, 1, 3);
INSERT INTO Orders  VALUES (3, DATE '2019-08-03', 3, 2, 3);
INSERT INTO Orders  VALUES (4, DATE '2019-08-04', 1, 4, 2);
INSERT INTO Orders  VALUES (5, DATE '2019-08-04', 1, 3, 4);
INSERT INTO Orders  VALUES (6, DATE '2019-08-05', 2, 2, 4);

