with name as(
    SELECT time,user,response,path  FROM `test_rest_api_log` 
    WHERE path = 'video-maker/models'and response is not null and time is not null
),list_ as (
        SELECT name.time, name.user , JSON_QUERY(name.response, '$.models[0].display_name') as name_list0,
                JSON_QUERY(name.response, '$.models[1].display_name')as name_list1,
                JSON_QUERY(name.response, '$.models[2].display_name')as name_list2,
                JSON_QUERY(name.response, '$.models[3].display_name')as name_list3,
                JSON_QUERY(name.response, '$.models[4].display_name')as name_list4,
                JSON_QUERY(name.response, '$.models[5].display_name')as name_list5,
                JSON_QUERY(name.response, '$.models[6].display_name')as name_list6,
                JSON_QUERY(name.response, '$.models[7].display_name')as name_list7,
                JSON_QUERY(name.response, '$.models[8].display_name') as name_list8 from name
        where JSON_QUERY(name.response, '$.models[0].display_name') is not null and 
                JSON_QUERY(name.response, '$.models[1].display_name') is not null and
                JSON_QUERY(name.response, '$.models[2].display_name')is not null and
                JSON_QUERY(name.response, '$.models[3].display_name')is not null and
                JSON_QUERY(name.response, '$.models[4].display_name') is not null and
                JSON_QUERY(name.response, '$.models[5].display_name') is not null and
                JSON_QUERY(name.response, '$.models[6].display_name') is not null and
                JSON_QUERY(name.response, '$.models[7].display_name')is not null and
                JSON_QUERY(name.response, '$.models[8].display_name') is not null
    ),list_0 as (
        select list_.time,EXTRACT(WEEK FROM list_.time) as week ,list_.user ,REGEXP_REPLACE(list_.name_list0, 'Fast|New','') AS list_0 from list_
    ),list_1 as (
        select list_.time, EXTRACT(WEEK FROM list_.time) as week ,list_.user ,REGEXP_REPLACE(list_.name_list1, 'Fast|New','') AS list_1 from list_ 
    ),list_2 as (
        select list_.time, EXTRACT(WEEK FROM list_.time) as week ,list_.user ,REGEXP_REPLACE(list_.name_list2, 'Fast|New','')  AS list_2 from list_ 
    ),list_3 as (
        select list_.time, EXTRACT(WEEK FROM list_.time) as week ,list_.user ,REGEXP_REPLACE(list_.name_list3, 'Fast|New','') AS list_3 from list_ 
    ),
    list_4 as (
        select list_.time, EXTRACT(WEEK FROM list_.time) as week ,list_.user ,REGEXP_REPLACE(list_.name_list4, 'Fast|New','')  AS list_4 from list_ 
    ),
    list_5 as (
        select list_.time, EXTRACT(WEEK FROM list_.time) as week ,list_.user ,REGEXP_REPLACE(list_.name_list5, 'Fast|New','') AS list_5  from list_ 
    ),
    list_6 as (
        select list_.time, EXTRACT(WEEK FROM list_.time) as week ,list_.user ,REGEXP_REPLACE(list_.name_list6, 'Fast|New','') AS list_6 from list_ 
    ),
    list_7 as (
        select list_.time, EXTRACT(WEEK FROM list_.time) as week ,list_.user ,REGEXP_REPLACE(list_.name_list7, 'Fast|New','') AS list_7  from list_ 
    ),
    list_8 as (
        select list_.time, EXTRACT(WEEK FROM list_.time) as week ,list_.user ,REGEXP_REPLACE(list_.name_list8, 'Fast|New','') AS list_8 from list_ 
    ), 
    puls as (
    select * from list_0
    UNION ALL
    select * from list_1
    UNION ALL
    select * from list_2
    UNION ALL
    select * from list_3
    UNION ALL
    select * from list_4
    UNION ALL
    select * from list_5
    UNION ALL
    select * from list_6
    UNION ALL
    select * from list_7
    UNION ALL
    select * from list_8
    )
select * from puls


