# Question 1
create database alumni;
use alumni;
# Question 2
desc college_a_hs;
desc college_a_se;
desc college_a_sj;
desc college_b_hs;
desc college_b_se;
desc college_b_sj;
select*from college_b_hs;
# Question 6
create view College_A_HS_V as (select*from college_a_hs where RollNo is not null and LastUpdate is not null and Name is not null and FatherName is not null and MotherName is not null and Batch is not null and Degree is not null and PresentStatus is not null and HSDegree is not null and EntranceExam is not null and Institute is not null and Location is not null);
# Question 7
create view College_A_se_V as (select*from college_a_se where RollNo is not null and LastUpdate is not null and Name is not null and FatherName is not null and MotherName is not null and Batch is not null and Degree is not null and PresentStatus is not null and organization is not null and  Location is not null);

# Question 8
create view college_a_sj_v as (select*from college_a_sj where RollNo is not null and LastUpdate is not null and Name is not null and FatherName is not null and MotherName is not null and Batch is not null and Degree is not null and PresentStatus is not null and Organization is not null and Designation is not null and Location is not null);
# Question 9
create view college_b_hs_v as (select*from college_b_hs where RollNo is not null and LastUpdate is not null and Name is not null and FatherName is not null and MotherName is not null and Batch is not null and Degree is not null and PresentStatus is not null and HSDegree is not null and EntranceExam is not null and Institute is not null and Location is not null);
# Question 10
create view college_b_se_v as (select*from college_b_se where RollNo is not null and LastUpdate is not null and Name is not null and FatherName is not null and MotherName is not null and Batch is not null and Degree is not null and PresentStatus is not null and Organization is not null and Location is not null);
# Question 11
create view college_b_sj_v as (select*from college_b_sj where RollNo is not null and LastUpdate is not null and Name is not null and FatherName is not null and MotherName is not null and Batch is not null and Degree is not null and PresentStatus is not null and Organization is not null and Designation is not null and Location is not null);
  
# question 12 create procedure using string funcation
delimiter //
create procedure p_01()
  BEGIN
select lower(NAME) as Name,lower(FATHERNAME) as FatherName,lower(MOTHERNAME) as MotherName FROM COLLEGE_A_HS_V;
END //
delimiter ;
delimiter //
create procedure p_02()
select lower(NAME) as Name,lower(FATHERNAME) as FatherName,lower(MOTHERNAME) as MotherName FROM COLLEGE_A_SJ_V
 END //
delimiter ;
delimiter 
create procedure p_03()
select lower(NAME) as Name,lower(FATHERNAME) as FatherName,lower(MOTHERNAME) as MotherName FROM college_a_se_v
 END //
delimiter ;

delimiter //
create procedure p_04()
select lower(NAME) as Name,lower(FATHERNAME) as FatherName,lower(MOTHERNAME) as MotherName FROM college_b_hs_v
 END //
delimiter ;

delimiter //
create procedure p_05()
select lower(NAME) as Name,lower(FATHERNAME) as FatherName,lower(MOTHERNAME) as MotherName FROM college_b_se_v
 END //
delimiter ;

delimiter //
create procedure p_06()
select lower(NAME) as Name,lower(FATHERNAME) as FatherName,lower(MOTHERNAME) as MotherName FROM college_b_sj_v
 END //
delimiter ;
call p_01;
call p_02;
call p_03;
call p_04;
call p_05;
call p_06;
# Question 13 in excel file import veiw in excel sheet
# Question 14 fatch all name from the table by create a procedure
DELIMITER $$
CREATE PROCEDURE get_name_collegeA (INOUT collegename TEXT(40000))
BEGIN
    DECLARE finished INT DEFAULT 0;
    DECLARE getnamedetail VARCHAR(16000) DEFAULT "";
    DECLARE getnames CURSOR FOR
        SELECT name FROM college_a_hs
        UNION
        SELECT name FROM college_a_se
        UNION
        SELECT name FROM college_a_sj;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

    OPEN getnames;
    get_name_collegeA_loop: LOOP
        FETCH getnames INTO getnamedetail;
        IF finished = 1 THEN
            LEAVE get_name_collegeA_loop;
        END IF;
        SET collegename = CONCAT(getnamedetail, "; ", collegename);
    END LOOP get_name_collegeA_loop;
    CLOSE getnames;
END $$
DELIMITER ;

-- Example usage
SET @collegename = "";
CALL get_name_collegeA(@collegename);
select @collegename;

# Question 15 create procedure for college B
DELIMITER $$
CREATE PROCEDURE get_name_collegeB (INOUT collegename TEXT(40000))
BEGIN
    DECLARE finished INT DEFAULT 0;
    DECLARE getnamedetail VARCHAR(16000) DEFAULT "";
    DECLARE getnames CURSOR FOR
        SELECT name FROM college_b_hs
        UNION
        SELECT name FROM college_b_se
        UNION
        SELECT name FROM college_b_sj;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

    OPEN getnames;
    get_name_collegeA_loop: LOOP
        FETCH getnames INTO getnamedetail;
        IF finished = 1 THEN
            LEAVE get_name_collegeA_loop;
        END IF;
        SET collegename = CONCAT(getnamedetail, "; ", collegename);
    END LOOP get_name_collegeA_loop;
    CLOSE getnames;
END $$
DELIMITER ;

SET @collegename = "";
CALL get_name_collegeB(@collegename);
select @collegename;
# Question 16
SELEct "Higher Studies" Present_status,((SELECT COUNT(*) FROM college_a_hs) / ((SELECT COUNT(*) FROM college_a_hs)+(SELECT COUNT(*) FROM college_a_se)+(SELECT COUNT(*) FROM college_a_sj)))*100 College_A_Percentages,
((SELECT COUNT(*) FROM college_b_hs) / ((SELECT COUNT(*) FROM college_b_hs)+(SELECT COUNT(*) FROM college_b_se)+(SELECT COUNT(*) FROM college_b_sj)))*100 College_B_Percentages
union all
SELEct "self_Employed" Present_status,((SELECT COUNT(*) FROM college_a_se) / ((SELECT COUNT(*) FROM college_a_hs)+(SELECT COUNT(*) FROM college_a_se)+(SELECT COUNT(*) FROM college_a_sj)))*100 College_A_Percentages
,((SELECT COUNT(*) FROM college_b_se) / ((SELECT COUNT(*) FROM college_b_hs)+(SELECT COUNT(*) FROM college_b_se)+(SELECT COUNT(*) FROM college_b_sj)))*100 College_B_Percentages
union all
SELEct "Service_Job" Present_status,((SELECT COUNT(*) FROM college_a_sj) / ((SELECT COUNT(*) FROM college_a_hs)+(SELECT COUNT(*) FROM college_a_se)+(SELECT COUNT(*) FROM college_a_sj)))*100 College_A_Percentages
,((SELECT COUNT(*) FROM college_b_sj) / ((SELECT COUNT(*) FROM college_b_hs)+(SELECT COUNT(*) FROM college_b_se)+(SELECT COUNT(*) FROM college_b_sj)))*100 College_B_Percentages


