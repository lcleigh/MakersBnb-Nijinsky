DROP TABLE IF EXISTS spaces CASCADE; 

CREATE TABLE spaces (
    id SERIAL PRIMARY KEY,
    name text,
    price float,
    description text,
    availability text
);

TRUNCATE TABLE spaces RESTART IDENTITY;


INSERT INTO spaces (name, price, description, availability) VALUES ('Treehouse', 200.00, 'Sleep in the trees. See the animals.', 'link to API');
INSERT INTO spaces (name, price, description, availability) VALUES ('Lighthouse', 350.00, 'Views of the sea.', 'link to API');

