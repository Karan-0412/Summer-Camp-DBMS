CREATE TABLE transactions
(
transaction_id INT PRIMARY KEY,
merchant_id INT,
credit_card_id INT,
amount INT,
transaction_timestamp TIMESTAMP
);
INSERT INTO transactions
VALUES
(1, 101, 1, 100, '2022-09-25 12:00:00'),
(2, 101, 1, 100, '2022-09-25 12:08:00'),
(3, 101, 1, 100, '2022-09-25 12:28:00'),
(4, 102, 2, 300, '2022-09-25 12:00:00'),
(6, 102, 2, 400, '2022-09-25 14:00:00') ;


select count(t2.transaction_id) as payment_count
from transactions t1 
join transactions t2 
on t1.credit_card_id = t2.credit_card_id
and t2.amount = t1.amount
and t2.transaction_timestamp > t1.transaction_timestamp  
and t2.transaction_timestamp <= t1.transaction_timestamp + INTERVAL '10 minutes' ;


CREATE TABLE user_actions
(
user_id INT,
event_id INT,
event_type VARCHAR(20),
event_date TIMESTAMP
);
INSERT INTO user_actions
VALUES
(445, 7765, 'sign-in', '2022-06-05 12:00:00'),
(742, 6458, 'sign-in', '2022-06-10 12:00:00'),
(648, 3124, 'like', '2022-06-18 12:00:00'),
(445, 3634, 'like', '2022-07-05 12:00:00'),
(742, 1374, 'comment', '2022-07-15 12:00:00'),
(999, 5555, 'sign-in', '2022-07-20 12:00:00');

select 7 as months, count(distinct u1.user_id) 
from user_actions u1
join user_actions u2
on u1.user_id = u2.user_id 
where Extract(month from u1.event_date) = 6 and
Extract(month from u2.event_date) = 7 and
Extract(year from u2.event_date) = 2022 ;

CREATE TABLE Submissions (
sub_id INT,
parent_id INT
);
INSERT INTO Submissions (sub_id, parent_id) VALUES
(1, NULL),
(2, NULL),
(1, NULL),
(12, NULL),
(3, 1),
(5, 2),
(3, 1),
(4, 1),
(9, 1),
(10, 2),
(6, 7);


Select sub_id as post_id, 
(Select count(distinct s2.sub_id)
from Submissions s2
where parent_id is not Null
and s1.sub_id = s2.parent_id 
) as number_of_comments
from Submissions s1
where s1.parent_id is Null
group by sub_id 
order by sub_id ;



