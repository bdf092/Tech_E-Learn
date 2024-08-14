/*Using any type of the joins create a view that combines multiple tables in a logical way */

/* RECAP PER USER ON FAVORITES COURSES */

CREATE VIEW UserDetails AS
SELECT 
    u.userID,
    u.username,
    u.email,
    f.courseID AS favorite_courseID,
    c.course_title AS favorite_course_title
FROM 
    users u
JOIN  
    favorites f ON u.userID = f.userID
JOIN
	courses c ON f.courseID = c.courseID;
    

drop view UserDetails;
select * from UserDetails;


/* In your database, create a stored function that can be applied to a query in your DB */

DELIMITER //

create function GetUserDet(userId INT)
returns varchar(255)
deterministic
begin
    declare userDetails varchar(255);

    select CONCAT('Username: ', username, ', Email: ', email, ', Forum Questions Count: ', forum_question_count)
    into userDetails
    from (
        select 
            u.username,
            u.email,
            COUNT(fq.questionID) AS forum_question_count
        from 
            users u
        join 
            forum_questions fq ON u.userID = fq.userID
        where 
            u.userID = userId
        group by 
            u.userID
    ) as userDetailsQuery;

    return userDetails;
end//

DELIMITER ;


select GetUserDetails(1);
/* Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis */

/* users who have asked questions in the forum and their favorte course */
select
	u.username as User,
    c.course_title as Favorite_Course
from users u
join
	favorites f on u.userID = f.userID
join
	courses c on f.courseID = c.courseID
where
	u.userID in (
    select distinct fq.userID
    from
		forum_questions fq
	);
    
    
/* In your database, create a stored procedure and demonstrate how it runs */
DELIMITER //

create procedure InsertUser(
    IN inputUserID INT, 
    IN inputUsername VARCHAR(45),
    IN inputEmail VARCHAR(45),
    IN inputPassword VARCHAR(45)
)
begin
    insert into users(userID, username, email, password)
    values (inputUserID, inputUsername, inputEmail, inputPassword);
end//

DELIMITER ;


CALL InsertUser(7, 'trial', 'trtial@hotmail.com', 'passwordtrial');

select * from users;