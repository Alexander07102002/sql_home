DELIMITER $$

CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE secs INT;
    DECLARE result VARCHAR(255);
    
    SET days = FLOOR(seconds / (24 * 3600));
    SET seconds = seconds - (days * 24 * 3600);
    
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds - (hours * 3600);
    
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds - (minutes * 60);
    
    SET secs = seconds;
    
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', secs, ' seconds');
    
    RETURN result;
END$$

DELIMITER ;

SELECT format_seconds(123456);



SELECT number
FROM (
    SELECT 1 AS number
    UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
    UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
) AS numbers
WHERE number % 2 = 0;
