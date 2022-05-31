CREATE OR REPLACE FUNCTION random_between(low INT ,high INT) 
   RETURNS INT AS
$$
BEGIN
   RETURN floor(random()* (high-low + 1) + low);
END;
$$ language 'plpgsql' STRICT;


-----------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE FUNCTION insertPeople()
   returns int 
   language plpgsql
  as
$$
declare 
-- variable declaration
	r record;
	--tempAddressId int;
	--tempRoleId int;
begin
 -- logic
	
	create temp table temp(
        firstName character varying, 
        lastName character varying,
        age integer,
        email character varying);
    copy temp from 'C:\Users\Public\oldPeople.csv' (format csv, header);
   
   FOR r IN
        SELECT * FROM temp
    LOOP
        -- can do some processing here
	    --tempAddressId = SELECT random_between(1,21);
	    --tempRoleId = 
	    INSERT INTO users(firstName, lastName, age, email, address_id, role_id)
		VALUES (r.firstName, r.lastName, r.age, r.email, (SELECT random_between(1,20)), 2);
	    RAISE NOTICE '%', r.firstName;
         -- return current row of SELECT
    END loop;
    drop table temp;
	
	return 0;
end;
$$