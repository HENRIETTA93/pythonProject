-- Add your SQL code here to implement the functionality surrounding changes to the Inventory table, as specified in the readme

DROP TRIGGER if exists sell_inventory ON inventory;
DROP FUNCTION if exists record_sale;

CREATE FUNCTION record_sale() RETURNS TRIGGER
AS $$
DECLARE
    num INT := OLD.numberinstock - NEW.numberinstock;
    inventory_price inventory.price%TYPE;
BEGIN
    SELECT price INTO inventory_price
    FROM inventory
    WHERE albumid = NEW.albumid;

    INSERT INTO sale(albumid, quantity, totalsale, saledate)
    VALUES(NEW.albumId, num, num * inventory_price, now());

    RETURN NEW;
end;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sell_inventory
    AFTER UPDATE OF numberInStock ON inventory
    FOR EACH ROW
    WHEN (OLD.numberinstock > NEW.numberinstock)
    EXECUTE PROCEDURE record_sale();