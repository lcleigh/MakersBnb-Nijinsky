DROP TABLE IF EXISTS spaces CASCADE; 

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

TRUNCATE TABLE spaces RESTART IDENTITY;

INSERT INTO spaces (name, price, description, availability, account_id) VALUES ('Treehouse', 200.00, 'Sleep in the trees. See the animals.', '<script src="https://cdn.supersaas.net/widget.js"></script>
<script class="supersaas-widget">var supersaas = new SuperSaaS("484509:Nijinsky-MakersBnB","655119:Treehouse",{})</script>


<!-- Pop-up button -->
<button onclick="supersaas && supersaas.show()" style="border: 0px; border-radius: 3px; cursor: pointer; font-family: Arial, sans-serif; font-size: 18px; font-weight: bold; background-color: #0078cc; padding: 5px 10px; color: rgb(255, 255, 255)">Book now</button>', '2');
INSERT INTO spaces (name, price, description, availability, account_id) VALUES ('Lighthouse', 350.00, 'Views of the sea.', '<script src="https://cdn.supersaas.net/widget.js"></script>
<script class="supersaas-widget">var supersaas = new SuperSaaS("484509:Nijinsky-MakersBnB","654926:Lighthouse",{})</script>

<!-- Pop-up button -->
<button onclick="supersaas && supersaas.show()" style="border: 0px; border-radius: 3px; cursor: pointer; font-family: Arial, sans-serif; font-size: 18px; font-weight: bold; background-color: #0078cc; padding: 5px 10px; color: rgb(255, 255, 255)">Book now</button>', 1);
INSERT INTO spaces (name, price, description, availability, account_id) VALUES ('Cottage', 50.00, 'Comes with dog.', 'link to API', 1);
INSERT INTO spaces (name, price, description, availability, account_id) VALUES ('Post Office', 185.00, 'Stamp your mark on this property.', 'link to API', 2);
INSERT INTO spaces (name, price, description, availability, account_id) VALUES ('Windmill', 360.00, 'For sail for one night only', 'link to API', 1);
