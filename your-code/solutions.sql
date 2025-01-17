-- Derived Table --

select
	au.au_id,
	SUM(tl.price * sl.qty * tl.royalty / 100 * tlau.royaltyper / 100) + SUM(tl.price * sl.qty * tl.advance) as profit
from
	authors as au
left join
    titleauthor as tlau on
	au.au_id = tlau.au_id
left join
    titles as tl on
	tlau.title_id = tl.title_id
left join
    sales as sl on
	tl.title_id = sl.title_id
group by
	au.au_id,
	tl.title_id
order by
	profit desc
limit 3;

-- Temporary Table --

create temporary table royalties 
select
	au.au_id,
	SUM(tl.price * sl.qty * tl.royalty / 100 * tlau.royaltyper / 100) + SUM(tl.price * sl.qty * tl.advance) as profit
from
	authors as au
left join
    titleauthor as tlau on
	au.au_id = tlau.au_id
left join
    titles as tl on
	tlau.title_id = tl.title_id
left join
    sales as sl on
	tl.title_id = sl.title_id
group by
	au.au_id,
	tl.title_id
order by
	profit desc
limit 3;

-- New Table --

create table most_profiting_authors
(
select
	au.au_id,
	SUM(tl.price * sl.qty * tl.royalty / 100 * tlau.royaltyper / 100) + SUM(tl.price * sl.qty * tl.advance) as profit
from
	authors as au
left join
    titleauthor as tlau on
	au.au_id = tlau.au_id
left join
    titles as tl on
	tlau.title_id = tl.title_id
left join
    sales as sl on
	tl.title_id = sl.title_id
group by
	au.au_id,
	tl.title_id
order by
	profit desc
limit 3);