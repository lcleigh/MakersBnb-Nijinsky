DROP TABLE IF EXISTS accounts CASCADE; 

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name text,
  password text,
  email text,
  phone text
);

TRUNCATE TABLE accounts RESTART IDENTITY;


INSERT INTO accounts (name, password, email, phone) VALUES ('DannyW', 'pa55word!', 'dannyw@makers.bnb', '07777777777');
INSERT INTO accounts (name, password, email, phone) VALUES ('TomD', 'another_pa55word!', 'tom@makers.bnb', '07777777777');

