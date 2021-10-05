DROP TABLE IF EXISTS recipe_ingredient CASCADE;
DROP TABLE IF EXISTS recipe CASCADE;
DROP TABLE IF EXISTS ingredient CASCADE;

CREATE TABLE ingredient (
  code          CHAR(8) PRIMARY KEY,
  name          VARCHAR(127) UNIQUE,
  calories      FLOAT,
  cost_per_unit NUMERIC(7, 2),
  is_kosher     BOOLEAN
);
CREATE TABLE recipe (
  name         VARCHAR(63) PRIMARY KEY,
  instructions TEXT,
  servings     INT,
  course       VARCHAR(15),
  season       VARCHAR(15)
);
CREATE TABLE recipe_ingredient (
  ingredient CHAR(8) REFERENCES ingredient ON UPDATE CASCADE ON DELETE SET NULL,
  recipe     VARCHAR(63) REFERENCES recipe ON UPDATE CASCADE ON DELETE CASCADE,
  amount     FLOAT
);

GRANT ALL PRIVILEGES ON ingredient, recipe, recipe_ingredient TO restaurant;

INSERT INTO ingredient VALUES ('11111111', 'Sliced Bread', 1000, 2.99, TRUE);
INSERT INTO ingredient VALUES ('11111112', 'Roasted Chicken', 200, 7.49, TRUE);
INSERT INTO ingredient VALUES ('11111113', 'Mayonnaise', 3200, 3.45, TRUE);
INSERT INTO ingredient VALUES ('11111114', 'Ham', 450, 6.79, FALSE);
INSERT INTO ingredient VALUES ('11111115', 'Cheese', 500, 3.00, TRUE);
INSERT INTO ingredient VALUES ('11111116', 'Mustard', 150, 1.75, TRUE);
INSERT INTO ingredient VALUES ('11111117', 'Potatoes (12)', 1000, 4.00, TRUE);
INSERT INTO ingredient VALUES ('11111118', 'Lettuce', 75, 2.99, TRUE);
INSERT INTO ingredient VALUES ('11111119', 'Ground Beef', 600, 4.59, TRUE);
INSERT INTO ingredient VALUES ('11111120', 'Hamburger Buns', 400, 1.50, TRUE);
INSERT INTO ingredient VALUES ('11111121', 'Salad Dressing', 4800, 3.99, TRUE);
INSERT INTO ingredient VALUES ('11111122', 'Pie Crust', 1000, 1.50, TRUE);
INSERT INTO ingredient VALUES ('11111123', 'Pumpkin Pie Filling', 2000, 2.99, TRUE);
INSERT INTO ingredient VALUES ('11111124', 'Vanilla Ice Cream', 1600, 2.99, TRUE);
INSERT INTO ingredient VALUES ('11111125', 'Chocolate Sauce', 6400, 5.00, TRUE);
INSERT INTO ingredient VALUES ('11111126', 'Milk', 1600, 2.79, TRUE);
INSERT INTO recipe VALUES ('Chicken Sandwich', 'Spread mayonnaise on a slice of bread. Place chicken on top, add a second slice of bread on top of that.', 1, 'Entree', 'Spring');
INSERT INTO recipe VALUES ('Ham Sandwich', 'Spread mustard on two slices of bread. Place ham and cheese between them.', 1, 'Entree', 'Fall');
INSERT INTO recipe VALUES ('French Fries', 'Slice potatoes and fry them.', 3, 'Side', 'All');
INSERT INTO recipe VALUES ('Garden Salad', 'Assemble ingredients in a bowl and toss them together.', 8, 'Side', 'All');
INSERT INTO recipe VALUES ('Hamburger', 'Form ground beef into patties. Cook patties to order. Place patties on bun. Serve open face', 1, 'Entree', 'All');
INSERT INTO recipe VALUES ('Pumpkin Pie', 'Pour pie filling into pie crust. Bake at an appropriate temperature until done.', 8, 'Dessert', 'Fall');
INSERT INTO recipe VALUES ('Ice Cream Sundae', 'Scoop ice cream into dish, and add chocolate sauce.', 1, 'Dessert', 'Spring');
INSERT INTO recipe VALUES ('Milkshake', 'Add ice cream and milk to blender, and blend until smooth. Serve in a tall glass.', 2, 'Dessert', 'All');
INSERT INTO recipe VALUES ('Ham and Mashed Potatoes', 'Roast ham in oven until hot. Boil potatoes until done, then mash and add milk to make them smooth.', 4, 'Entree', 'Spring');
INSERT INTO recipe_ingredient VALUES ('11111111', 'Chicken Sandwich', .2);
INSERT INTO recipe_ingredient VALUES ('11111112', 'Chicken Sandwich', .2);
INSERT INTO recipe_ingredient VALUES ('11111113', 'Chicken Sandwich', .03125);
INSERT INTO recipe_ingredient VALUES ('11111111', 'Ham Sandwich', .2);
INSERT INTO recipe_ingredient VALUES ('11111114', 'Ham Sandwich', .2);
INSERT INTO recipe_ingredient VALUES ('11111116', 'Ham Sandwich', .015625);
INSERT INTO recipe_ingredient VALUES ('11111115', 'Ham Sandwich', .125);
INSERT INTO recipe_ingredient VALUES ('11111117', 'French Fries', .1667);
INSERT INTO recipe_ingredient VALUES ('11111118', 'Garden Salad', .125);
INSERT INTO recipe_ingredient VALUES ('11111121', 'Garden Salad', .015625);
INSERT INTO recipe_ingredient VALUES ('11111119', 'Hamburger', .25);
INSERT INTO recipe_ingredient VALUES ('11111120', 'Hamburger', .25);
INSERT INTO recipe_ingredient VALUES ('11111122', 'Pumpkin Pie', 1);
INSERT INTO recipe_ingredient VALUES ('11111123', 'Pumpkin Pie', 1);
INSERT INTO recipe_ingredient VALUES ('11111124', 'Pumpkin Pie', .0625);
INSERT INTO recipe_ingredient VALUES ('11111124', 'Ice Cream Sundae', .0625);
INSERT INTO recipe_ingredient VALUES ('11111125', 'Ice Cream Sundae', .03125);
INSERT INTO recipe_ingredient VALUES ('11111124', 'Milkshake', .125);
INSERT INTO recipe_ingredient VALUES ('11111126', 'Milkshake', .0625);
INSERT INTO recipe_ingredient VALUES ('11111114', 'Ham and Mashed Potatoes', 1);
INSERT INTO recipe_ingredient VALUES ('11111117', 'Ham and Mashed Potatoes', .5);
INSERT INTO recipe_ingredient VALUES ('11111126', 'Ham and Mashed Potatoes', .0625);

