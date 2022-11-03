DROP TABLE IF EXISTS accounts CASCADE; 

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name text,
  password text,
  email text,
  phone text
);

TRUNCATE TABLE accounts RESTART IDENTITY;


INSERT INTO accounts (name, password, email, phone) VALUES ('DannyW', '$2a$12$sLTKZiozTwGIpKzLI6ZE9O3dXsWawEsGxmQ/O.vjVNTWq0HIhA3WC', 'dannyw@makers.bnb', '07777777777');
INSERT INTO accounts (name, password, email, phone) VALUES ('TomD', '$2a$12$2ePvoZfsj6ch7VgSGiOBmuO8YG81RL1Z54Dwtm2mkSqyr2wYvXZby', 'tom@makers.bnb', '07777777777');
