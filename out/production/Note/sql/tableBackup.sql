/*
backup table 생성방법
제약조건을 제외한 데이터만 들어감.

create table chost_t_0020 select * from chost_t_0020_20220317;

*/
/*
제약조건까지 같이 넣는 방법
create table kiiee_t_0018_20240101 like kiiee_t_0018;
insert into kiiee_t_0018_20240101 select * from kiiee_t_0018;

*/
