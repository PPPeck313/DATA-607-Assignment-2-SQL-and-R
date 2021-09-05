select * from critic;
select * from critic_movie;
select * from director;
select * from experience;
select * from genre;
select * from movie;
select * from occupation;
select * from rating;



truncate critic;
ALTER SEQUENCE critic_id_seq RESTART WITH 0;

truncate director;
ALTER SEQUENCE director_id_seq RESTART WITH 0;



select m.title, avg(r.num_of_star) as average_critic_star_rating 
from critic_movie as cm
left join critic as c
on c.id = cm.critic_id
left join rating as r
on r.id = cm.rating_id
left join movie as m
on m.id = cm.movie_id
group by m.id
order by average_critic_star_rating;



select title, average_critic_star_rating, num_of_star as metacritic_star_rating, (average_critic_star_rating - num_of_star) as critic_metacritic_star_rating_difference
from(
	select m.title, m.metacritic_rating_id, avg(r.num_of_star) as average_critic_star_rating 
	from critic_movie as cm
	left join critic as c
	on c.id = cm.critic_id
	left join rating as r
	on r.id = cm.rating_id
	left join movie as m
	on m.id = cm.movie_id
	group by m.id
	order by average_critic_star_rating
) as cmr
left join rating as r
on r.id = cmr.metacritic_rating_id;



select e.name, avg(r.num_of_star) as average_critic_star_rating 
from critic_movie as cm
left join critic as c
on c.id = cm.critic_id
left join rating as r
on r.id = cm.rating_id
left join experience as e
on e.id = c.experience_id
group by e.id
order by average_critic_star_rating;



select concat(c.generation, '_', m.generation) as client_movie_generation, avg(r.num_of_star) as average_critic_star_rating
from critic_movie as cm
left join(
	select *, case 
	when year_born <= 1945 then 'Silent Gen'
	when year_born >= 1946 and year_born <= 1964 then 'Baby Boomers'
	when year_born >= 1965 and year_born <= 1976 then 'Gen X'
	when year_born >= 1977 and year_born <= 1995 then 'Millennials'
	when year_born >= 1996 and year_born <= 2015 then 'Gen Z'
	else 'Gen Alpha'
	end generation
	from (
		select *, extract(year from birthday) as year_born 
		from critic
	) critic_year_born
) as c
on c.id = cm.critic_id
left join rating as r
on r.id = cm.rating_id
left join(
	select *, case 
	when year_released <= 1945 then 'Silent Gen'
	when year_released >= 1946 and year_released <= 1964 then 'Baby Boomers'
	when year_released >= 1965 and year_released <= 1976 then 'Gen X'
	when year_released >= 1977 and year_released <= 1995 then 'Millennials'
	when year_released >= 1996 and year_released <= 2015 then 'Gen Z'
	else 'Gen Alpha'
	end generation
	from movie
) as m
on m.id = cm.movie_id
where c.generation = m.generation
group by c.generation, m.generation
order by average_critic_star_rating;



select *
from critic_movie as cm
left join(
	select *, case 
	when age >= 0 and age < 10 then '0-9'
	when age >= 10 and age < 20 then '10-19'
	when age >= 20 and age < 30 then '20-29'
	when age >= 30 and age < 40 then '30-39'
	when age >= 40 and age < 50 then '40-49'
	when age >= 50 and age < 60 then '50-59'
	when age >= 60 and age < 70 then '60-69'
	else '70+'
	end age_range
	from (
		select *, extract(year from AGE(birthday)) as age 
		from critic
	)
critic_ages) as c
on c.id = cm.critic_id
left join rating as r
on r.id = cm.rating_id
left join movie as m
on m.id = cm.movie_id;