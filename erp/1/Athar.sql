SET SERVEROUTPUT ON;

-- Create a sequence for generating unique identification numbers
CREATE SEQUENCE id_sequence START WITH 1001;

-- Create a table to store identity card details
CREATE TABLE identity_cards (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    dob VARCHAR2(40),
    address VARCHAR2(200),
    aadhar_number VARCHAR2(12)
);

-- Procedure to generate and print an identity card
CREATE OR REPLACE PROCEDURE PrepareIdentityCard(
    p_name IN VARCHAR2,
    p_dob IN VARCHAR2,
    p_address IN VARCHAR2
)
IS
    v_aadhar_number VARCHAR2(12);
BEGIN
    -- Generate unique identification number
    SELECT 'AADHAR' || id_sequence.NEXTVAL INTO v_aadhar_number FROM dual;

    -- Insert identity card details into the table
    INSERT INTO identity_cards (id, name, dob, address, aadhar_number)
    VALUES (id_sequence.CURRVAL, p_name, p_dob, p_address, v_aadhar_number);

    -- Print the generated identity card details
    DBMS_OUTPUT.PUT_LINE('Identity Card Prepared:');
    DBMS_OUTPUT.PUT_LINE('Name: ' || p_name);
    DBMS_OUTPUT.PUT_LINE('Date of Birth: ' ||p_dob);
    DBMS_OUTPUT.PUT_LINE('Address: ' || p_address);
    DBMS_OUTPUT.PUT_LINE('AADHAR Number: ' || v_aadhar_number);
END;
/

-- Example usage: Prepare an identity card for an individual
BEGIN
    PrepareIdentityCard('John Doe','17/12/2003' , '123 Main Street, City, Country');
END;
/
