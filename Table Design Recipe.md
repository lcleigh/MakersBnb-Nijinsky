# Two Tables Design Recipe Template

_Copy this recipe template to design and create two related database tables from a specification._

## 1. Extract nouns from the user stories or specification

```
As a user
So that I can advertise and view spaces
I want to sign up for an account

As a user
So that only I can advertise and view spaces
I want to log in and log out of my account securely

As a user
So that I can hire out my available space
I want to advertise only nights that are available


As a user
So that I can advertise my space
I want to list the space as available

As a user
So that I can look for spaces available
I want to view all spaces available

As a user
So that I can advertise my spaces
I want to list multiple spaces as available.

As a user
So that I can advertise my spaces
I want to list a space with a name, description and price to my space

As a user
So that I can show my spaces availability
I want to list multiple dates that it is available

As a user
So that I can make a booking for a night
I want to request to hire a space

As a user
So that I can hire out my space
I want to be able to approve booking requests

As a user
So that I can request to book an available space
I want to only see nights that are available

As a user
So that I can hire out my available space
I want to have spaces available until I confirm a booking


```

```
Nouns:

account
spaces
available
description
securely
name
price
securely
multiple spaces
request
dates
approve booking
listing
view
booking
```

## 2. Infer the Table Name and Columns

Put the different nouns in this table. Replace the example with your own nouns.

| accounts              | spaces              | requests
| --------------------- | ------------------  |----------------
| name                  | account_id (fk)     | account_id (fk) [guest]
  password              | name                | spaces_id (fk)
  email (username)      | price               | date
  phone                 | description         | status 
                        | availability (API -- Booking Calender)



## 3. Decide the column types.

[Here's a full documentation of PostgreSQL data types](https://www.postgresql.org/docs/current/datatype.html).

Most of the time, you'll need either `text`, `int`, `bigint`, `numeric`, or `boolean`. If you're in doubt, do some research or ask your peers.

Remember to **always** have the primary key `id` as a first column. Its type will always be `SERIAL`.

```

Table: accounts
id: SERIAL
name: text
password: text
email: text
phone: text

Table: spaces
id: SERIAL
name: text
price: money
description: text
availability: text
account_id: int

Table: requests
id: SERIAL
date: date
Confirmed: Boolean
account_id: int
spaces_id: int

```

## 4. Decide on The Tables Relationship

Most of the time, you'll be using a **one-to-many** relationship, and will need a **foreign key** on one of the two tables.

To decide on which one, answer these two questions:

1. Can one [TABLE ONE] have many [TABLE TWO]? (Yes/No)
2. Can one [TABLE TWO] have many [TABLE ONE]? (Yes/No)

You'll then be able to say that:

1. **[A] has many [B]**
2. And on the other side, **[B] belongs to [A]**
3. In that case, the foreign key is in the table [B]

Replace the relevant bits in this example with your own:

```
-> An account can have many spaces
-> An account can have many requests
-> Spaces and Requests belong to an Account.
-> Therefore foreign key is in spaces and requests.

-> A space can have one account.
-> A space can have multiple requests.
-> Requests BELONGS to spaces.
-> Therefore foreign key is in requests.

-> A request will have one account (the guest).
-> A request can have one space.
-> A request BELONGS to both accounts and spaces.
-> 
```

*If you can answer YES to the two questions, you'll probably have to implement a Many-to-Many relationship, which is more complex and needs a third table (called a join table).*

## 4. Write the SQL.

```sql
-- EXAMPLE
-- file: bnb_table.sql

-- Replace the table name, columm names and types.

-- Create the table without the foreign key first.
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

-- Then the table with the foreign key first.
CREATE TABLE requests (
  id SERIAL PRIMARY KEY,
  date date,
  confirmed boolean,
  account_id int,
  constraint fk_account foreign key(account_id)
    references accounts(id)
    on delete cascade,
  space_id int,
  constraint fk_space foreign key(space_id)
    references spaces(id)
    on delete cascade
);


```

## 5. Create the tables.

```bash
psql -h 127.0.0.1 database_name < albums_table.sql
```