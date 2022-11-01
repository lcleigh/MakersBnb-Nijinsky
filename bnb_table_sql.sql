CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name text,
  password text,
  email text,
  phone text
);

CREATE TABLE spaces (
  id SERIAL PRIMARY KEY,
  name text,
  price float,
  description text,
  availability text,
  account_id int,
  constraint fk_account foreign key(account_id)
    references accounts(id)
    on delete cascade
);

CREATE TABLE requests (
  id SERIAL PRIMARY KEY,
  date date,
  status text,
  account_id int,
  constraint fk_account foreign key(account_id)
    references accounts(id)
    on delete cascade,
  space_id int,
  constraint fk_space foreign key(space_id)
    references spaces(id)
    on delete cascade
);