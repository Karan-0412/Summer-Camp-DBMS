----Soultion - 1 -----

select count(t2.transaction_id) as payment_count
from transactions t1 
join transactions t2 
on t1.credit_card_id = t2.credit_card_id
and t2.amount = t1.amount
and t2.transaction_timestamp > t1.transaction_timestamp  
and t2.transaction_timestamp <= t1.transaction_timestamp + INTERVAL '10 minutes' ;

---- Solution-2 ------

select 7 as months, count(distinct u1.user_id) 
from user_actions u1
join user_actions u2
on u1.user_id = u2.user_id 
where Extract(month from u1.event_date) = 6 and
Extract(month from u2.event_date) = 7 and
Extract(year from u2.event_date) = 2022 ;

----- Solution-3 -------

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



