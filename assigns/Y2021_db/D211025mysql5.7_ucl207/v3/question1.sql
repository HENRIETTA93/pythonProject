CREATE TABLE Customers (
    birth_day DATE,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    c_id INT,
    PRIMARY KEY (c_id)
);

CREATE TABLE Employees (
    birth_day DATE,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    e_id INT,
    PRIMARY KEY (e_id)
);

CREATE TABLE Locations (
    address VARCHAR(20),
    l_id INT,
    PRIMARY KEY (l_id)
);

CREATE TABLE Transactions (
    e_id INT,
    c_id INT,
    l_id INT,
    date DATE,
    t_id INT,
    PRIMARY KEY (t_id),
    FOREIGN KEY (e_id)
        REFERENCES Employees(e_id),
    FOREIGN KEY (c_id)
        REFERENCES Customers(c_id),
    FOREIGN KEY (l_id)
        REFERENCES Locations(l_id)
);

CREATE TABLE Items (
    price_for_each INT,
    name VARCHAR(20),
    PRIMARY KEY (name)
);

CREATE TABLE ItemsBroughtIntoShop (
    name VARCHAR(20),
    l_id INT,
    amount INT,
    date DATE,
    FOREIGN KEY (l_id)
        REFERENCES Locations(l_id),
    FOREIGN KEY (name)
        REFERENCES Items(name)
);

CREATE TABLE MovementOfItems (
    name VARCHAR(20),
    from_l_id INT,
    to_l_id INT,
    amount INT,
    date DATE,
    FOREIGN KEY (name)
        REFERENCES Items(name),
    FOREIGN KEY (from_l_id)
        REFERENCES Locations(l_id),
    FOREIGN KEY (to_l_id)
        REFERENCES Locations(l_id)
);

CREATE TABLE ItemsInTransactions (
    name VARCHAR(20),
    t_id INT,
    amount INT,
    FOREIGN KEY (name)
        REFERENCES Items(name),
    FOREIGN KEY (t_id)
        REFERENCES Transactions(t_id)
);

