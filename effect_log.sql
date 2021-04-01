with data_ as(
    SELECT time,user,response,path  FROM ``
    where path like '%/projects%'and user is not null and time is not null   
), effect_list as (

    select data_.time, data_.user, EXTRACT(WEEK FROM data_.time) as week,JSON_QUERY(data_.response, '$.intro_music') as name_list from data_ where JSON_QUERY(data_.response, '$.intro_music') is not null 
    
)

select  * from  effect_list