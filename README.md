# SQL
기본 sql 문법 



-------------table-----------------
||Column 1|Column 2|
|------|---|---|
|Row 1|Row 1, Column 1|Row 1, Column 2|
|Row 2|Row 2, Column 1|Row 2, Column 2|
|Row 3|Row 3, Column 1|Row 3, Column 2|

-------------table-----------------

----
## SELECT
데이터베이스에서 기본적으로 정보를 검색할때 사용한다
```
SELECT 컬럼 FROM 테이블 
```
```
ex)
SELECT Column 2 FROM Column_list 
```
```
//table_name에서 모든 열을 참조
SELECT * FROM Column_list 
```
---------------------------------------------------------------------------


## WITH
Query의재사용
> 쿼리Query : 
  데이터베이스에 정보를 요청하는 집합(문장)
  
```
WITH 별명 AS (
    QUERY
)
```
여러개 사용
```
WITH 별명 AS (
    QUERY
),WITH 별명 AS (
    QUERY
)
```
--------------------------------------------------------------------------


## WHERE

특정 조건에 부합하는 데이터들만 조회(if 문 비슷)

```
SELECT 컬럼 FROM 테이블 WHERE 컬럼 조건 값 
```

```
// 컬럼에 null 값은 안사용한다 
SELECT 컬럼 FROM 테이블 WHERE 컬럼 is not null
```
```
//and -> 연속적으로 사용
SELECT 컬럼,컬럼2 FROM 테이블 WHERE 컬럼 is not null and 컬럼2 is not null
```
---------------------------------------------------------------------------
# BigQuery
> 공식 문서
> https://cloud.google.com/bigquery/docs/reference/standard-sql/enabling-standard-sql?hl=ko 



## 1. JSON_QUERY
Bigquery 쿼리 안에서 json key 값 및 value 값 확인 
```
//.점으로 키값 확인 ex).music_list.name

JSON_QUERY(json 관련 필드, '$')
```

```
ex)
JSON_QUERY(name.response, '$.music_names[0].name')
```
> 관련링크
  https://cloud.google.com/bigquery/docs/reference/standard-sql/json_functions?hl=ko

-------

## 2. EXTRACT
Bigquery에서 data시간 관련 지원 함수
```
EXTRACT(시간 함수(링크참조) FROM '시간 관련 필드')
```
```
ex)
EXTRACT(WEEK FROM data_time)
```
> 관련링크
  https://cloud.google.com/bigquery/docs/reference/standard-sql/date_functions?hl=ko
--------  
## 구글 데이터슈튜디오

![스크린샷 2021-04-01 오후 2 51 09](https://user-images.githubusercontent.com/57163202/113249772-43afb500-92fa-11eb-9867-5d5e6560af8f.png)
