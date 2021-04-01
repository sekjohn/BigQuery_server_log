with data_ as(
    SELECT time,user,response,path  FROM ``
    where path like '%/projects%%cell%'and time is not null and user is not null  
    group by time,user,response,path
), data_list as (

    select data_.time, data_.user, EXTRACT(WEEK FROM data_.time) as week,JSON_QUERY(data_.response, '$.ml_model_name') as name_list from data_
    where data_.user is not null and JSON_QUERY(data_.response, '$.ml_model_name') is not null
    group by data_.time, data_.user,JSON_QUERY(data_.response, '$.ml_model_name')

)

select  * from data_list 