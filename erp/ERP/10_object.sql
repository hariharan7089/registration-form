CREATE OR REPLACE TYPE address_t AS OBJECT (
    street VARCHAR2(100),
    city VARCHAR2(50),
    state VARCHAR2(50),
    zip_code VARCHAR2(10)
);

CREATE OR REPLACE TYPE person_t AS OBJECT (
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    address address_t
);
/