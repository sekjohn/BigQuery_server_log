with name as(
SELECT time,user,response,path FROM 'test_rest_api_log'
where user is not null and time is not null
),list_ as (
SELECT name.time, name.user , JSON_QUERY(name.response, '$.music_names[0].name') as name_list0,
JSON_QUERY(name.response, '$.music_names[1].name') as name_list1,
JSON_QUERY(name.response, '$.music_names[2].name') as name_list2,
JSON_QUERY(name.response, '$.music_names[3].name') as name_list3,
JSON_QUERY(name.response, '$.music_names[4].name') as name_list4 from name
where JSON_QUERY(name.response, '$.music_names[0].name') is not null and
JSON_QUERY(name.response, '$.music_names[1].name') is not null and
JSON_QUERY(name.response, '$.music_names[2].name') is not null and
JSON_QUERY(name.response, '$.music_names[3].name') is not null and
JSON_QUERY(name.response, '$.music_names[4].name') is not null

),list_0 as (
select list_.time,EXTRACT(WEEK FROM list_.time) AS week, list_.user , list_.name_list0 AS list_0 from list_
),list_1 as (
select list_.time,EXTRACT(WEEK FROM list_.time) AS week, list_.user ,list_.name_list1 AS list_1 from list_
),list_2 as (
select list_.time,EXTRACT(WEEK FROM list_.time) AS week, list_.user ,list_.name_list2 AS list_2 from list_
),list_3 as (
select list_.time,EXTRACT(WEEK FROM list_.time) AS week, list_.user ,list_.name_list3 AS list_3 from list_
),list_4 as (
select list_.time,EXTRACT(WEEK FROM list_.time) AS week, list_.user ,list_.name_list4 AS list_4 from list_

),puls_list as (
select list_0.time,week , list_0.user, list_0.list_0 from list_0
UNION ALL
select list_1.time,week , list_1.user, list_1.list_1 from list_1
UNION ALL
select list_2.time ,week, list_2.user, list_2.list_2 from list_2
UNION ALL
select list_3.time ,week, list_3.user, list_3.list_3 from list_3
UNION ALL
select list_4.time , week,list_4.user, list_4.list_4 from list_4
)
select * from puls_list