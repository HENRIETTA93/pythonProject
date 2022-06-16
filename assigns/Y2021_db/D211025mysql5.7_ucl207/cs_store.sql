
-- Q1
CREATE TABLE `Customers` (
    `birth_day` DATE,
    `first_name` VARCHAR(20),
    `last_name` VARCHAR(20),
    `c_id` INT NOT NULL,
    PRIMARY KEY (`c_id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;
CREATE TABLE `Employees` (
    `birth_day` DATE,
    `first_name` VARCHAR(20),
    `last_name` VARCHAR(20),
    `e_id` INT NOT NULL,
    PRIMARY KEY (`e_id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;
CREATE TABLE `Locations` (
    `address` VARCHAR(20),
    `l_id` INT NOT NULL,
    PRIMARY KEY (`l_id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;
CREATE TABLE `Transactions` (
    `e_id` INT NOT NULL,
    `c_id` INT NOT NULL,
    `l_id` INT NOT NULL,
    `date` DATE,
    `t_id` INT NOT NULL,
    PRIMARY KEY (`t_id`),
    FOREIGN KEY (`c_id`) REFERENCES Customers (c_id),
    FOREIGN KEY (`e_id`) REFERENCES Employees (e_id),
    FOREIGN KEY (`l_id`) REFERENCES Locations (l_id)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;
CREATE TABLE `Items` (
    `price_for_each` INT,
    `name` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`name`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;
CREATE TABLE `ItemsBroughtIntoShop` (
    `name` VARCHAR(20),
    `l_id` INT,
    `amount` INT,
    `date` DATE,
    FOREIGN KEY (`name`) REFERENCES Items (`name`),
    FOREIGN KEY (`l_id`) REFERENCES Locations (`l_id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;
CREATE TABLE `MovementOfItems` (
    `name` VARCHAR(20),
    `from_l_id` INT,
    `to_l_id` INT,
    `amount` INT,
    `date` DATE,
    FOREIGN KEY (`name`) REFERENCES Items (`name`),
    FOREIGN KEY (`from_l_id`) REFERENCES Locations (l_id),
    FOREIGN KEY (`to_l_id`) REFERENCES Locations (l_id)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;
CREATE TABLE `ItemsInTransactions` (
    `name` VARCHAR(20),
    `t_id` INT,
    `amount` INT,
    FOREIGN KEY (`name`) REFERENCES Items (`name`),
    FOREIGN KEY (`t_id`) REFERENCES Transactions (`t_id`)
)  ENGINE=INNODB DEFAULT CHARSET=LATIN1;

-- Q2
CREATE VIEW DeniseTransactions AS
    SELECT 
        COUNT(*) AS number_of_transactions
    FROM
        Transactions t,
        Employees e
    WHERE
        t.t_id = e.e_id AND YEAR(t.date) = 2021
            AND MONTH(t.date) = 9;

-- SELECT * FROM DeniseTransactions;

-- Q3
CREATE VIEW PeopleInShop AS
    SELECT DISTINCT
        c.birth_day, c.first_name, c.last_name
    FROM
        Customers c,
        Transactions t
    WHERE
        t.c_id = c.c_id AND t.date = '2021-9-7'
            AND t.l_id = 1
    UNION SELECT DISTINCT
        e.birth_day, e.first_name, e.last_name
    FROM
        Employees e,
        Transactions t
    WHERE
        t.e_id = e.e_id AND t.date = '2021-9-7'
            AND t.l_id = 1
    ORDER BY birth_day ASC;

-- SELECT * FROM PeopleInShop;

-- Q4
CREATE VIEW TransactionValue AS
    SELECT 
        iit.t_id, SUM(i.price_for_each * iit.amount) AS value
    FROM
        Itemsintransactions iit,
        Items i
    WHERE
        i.name = iit.name
    GROUP BY iit.t_id;

-- SELECT * FROM TransactionValue;

-- Q5
CREATE VIEW ChangeDate AS
    SELECT DISTINCT
        t.date
    FROM
        Transactions t 
    UNION SELECT DISTINCT
        ibs.date
    FROM
        ItemsBroughtIntoShop ibs
    ORDER BY date;
CREATE VIEW DetailView AS
    SELECT DISTINCT
        i.`name`, l.l_id, c.date
    FROM
        Locations l,
        Items i,
        ItemsInTransactions iit,
        Transactions t,
        ItemsBroughtIntoShop ibs,
        ChangeDate c
    WHERE
        i.`name` = iit.`name`
            AND iit.t_id = t.t_id
            AND i.`name` = ibs.`name`
    GROUP BY i.`name` , l.l_id , c.date
    ORDER BY i.`name` , l.l_id , c.date;
CREATE VIEW SellView AS
    SELECT 
        dv.name, dv.l_id, dv.date, SUM(iit1.amount) AS amount
    FROM
        DetailView dv,
        ItemsInTransactions iit1,
        Transactions t1
    WHERE
        iit1.`name` = dv.`name`
            AND iit1.t_id = t1.t_id
            AND t1.l_id = dv.l_id
            AND t1.date <= dv.date
    GROUP BY dv.name , dv.l_id , dv.date;
CREATE VIEW BroughtView AS
    SELECT DISTINCT
        dv.name, dv.l_id, dv.date, SUM(ibs1.amount) AS amount
    FROM
        DetailView dv,
        ItemsBroughtIntoShop ibs1
    WHERE
        ibs1.`name` = dv.`name`
            AND ibs1.l_id = dv.l_id
            AND ibs1.date <= dv.date
    GROUP BY dv.name , dv.l_id , dv.date;
-- Q5
CREATE VIEW ItemsOnDateAndLocation AS
    SELECT 
        bv.name,
        bv.l_id,
        bv.date,
        bv.amount - IFNULL(sv.amount, 0) AS amount
    FROM
        Broughtview bv
            LEFT JOIN
        SellView sv ON bv.`name` = sv.`name`
            AND bv.l_id = sv.l_id
            AND bv.date = sv.date;
-- select * from ItemsOnDateAndLocation;
-- Q6
CREATE VIEW FeasibleLocations AS
    SELECT 
        l_id, IF(MIN(amount) < 0, 1, 0) AS feasible
    FROM
        ItemsOnDateAndLocation
    GROUP BY l_id;


