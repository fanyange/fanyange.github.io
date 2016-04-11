---
title: SQL
---
## data types
char
varchar
integer
date
boolean

## aggregate
count
sum
avg
max
min

distinct
where -> group by -> having -> select -> order by

## CRUD
insert into TableName (fields..) values (...)
delete from TableName where ...
update TableName set field1 = ..., field2 = ..., ...

## complicated queries
- create view ViewName as select ...
- subquery
- correlated subquery

## fun + pre + case
Functions
- replace(target, where, to)
- substring(str from start for len)
- current_timestamp
- extract
- cast(... as ...)
- **coalesce**

Predicates
- LIKE
- BETWEEN
- IN
- **EXISTS**

Case expression

## UNION operations
- union (all), intersect, except
- inner join (on), outer join, cross join

## window functions
fun over ([partition by] order by [null first/...])
- rank, dense_rank, row_number
- aggregate functions
- grouping
