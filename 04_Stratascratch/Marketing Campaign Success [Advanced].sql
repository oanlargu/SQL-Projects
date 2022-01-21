select count(distinct table1.user_id)
from (
	select *
	from (
		select	user_id,
				created_at,
				DENSE_RANK() over (partition by user_id order by created_at) as rank1,
				product_id		
		from dbo.campaign
		 ) as ranked_table
	where rank1 = 1
	 ) as table1
join (
	select *
	from (
		select	user_id,
				created_at,
				DENSE_RANK() over (partition by user_id order by created_at) as rank1,
				product_id		
		from dbo.campaign
		 ) as ranked_table
	where rank1 = 2
	  ) as table2
on table1.user_id = table2.user_id
where table1.created_at <> table2.created_at
	  and
	  table1.product_id <> table2.product_id
      