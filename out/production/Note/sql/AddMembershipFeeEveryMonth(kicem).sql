create procedure  addMembershipFeeEveryMonth()
begin
set @table_name = concat('kiiee_t_0018_',replace(current_date,'-',''));
set @create_table_sql = concat('create table ',@table_name , ' LIKE kiiee_t_0018');
set @drop_table_sql = concat('drop table if exists ',@table_name);

-- backup table 생성전 해당 table이 있으면 table drop
prepare stmt from @drop_table_sql;
execute stmt;
deallocate prepare stmt;

-- backup table 생성 (kiiee_t_0018_yyyyMMdd);
prepare stmt from @create_table_sql;
execute stmt;
deallocate prepare stmt;

-- table data insert INSERT kiiee_t_0018_20240807 SELECT * FROM kiiee_t_0018;
set @insert_data_sql = concat('insert ',@table_name ,' select * from kiiee_t_0018');
prepare stmt from @insert_data_sql;
execute stmt;
deallocate prepare stmt;

-- aik_code_ucode : '01' 명예회원, '02' 종신회원, '03' 정회원, '04' 학생회원
drop table if exists  kiiee_t_0018_2015_3_j;

create table kiiee_t_0018_2015_3_j
SELECT c.* FROM `kiiee_t_0018` c, kiiee_t_0012 d
where c.aik_user_code=d.aik_user_code and d.aik_code_ucode='03' and aik_end_year=year(current_date) and aik_end_month=lpad(month(current_date),2,0) and aik_val_code='02'
  and c.aik_user_code not in
    (
SELECT distinct a.aik_user_code FROM `kiiee_t_0018` a, kiiee_t_0012 b
where a.aik_user_code=b.aik_user_code and ((b.aik_code_ucode='03' and aik_end_year=year(current_date)+1 and aik_end_month=lpad(month(current_date),2,0)  and aik_val_code='02') or b.aik_code_ucode in ('01','02'))
    );

drop table if exists kiiee_t_0018_2015_3_p;

create table kiiee_t_0018_2015_3_p
SELECT c.* FROM `kiiee_t_0018` c, kiiee_t_0012 d
where c.aik_user_code=d.aik_user_code and d.aik_code_ucode='04' and aik_end_year=year(current_date) and aik_end_month=lpad(month(current_date),2,0) and aik_val_code='10'
  and c.aik_user_code not in
    (
SELECT distinct a.aik_user_code FROM `kiiee_t_0018` a, kiiee_t_0012 b
where a.aik_user_code=b.aik_user_code and ((b.aik_code_ucode='04' and aik_end_year=year(current_date)+1 and aik_end_month=lpad(month(current_date),2,0)  and aik_val_code='10') or b.aik_code_ucode in ('01','02'))
    );

insert into kiiee_t_0018 (`aik_user_code`,`aik_val_code`,`aik_won_num`,`aik_wowyear_etc`,`aik_wow_confim`,`aik_beg_year`,`aik_beg_month`,`aik_end_year`,`aik_end_month`,`aik_createdate`)
select aik_user_code,'02',80000,year(current_date),'0',year(current_date),lpad(month(current_date),2,0) ,year(current_date)+1,lpad(month(current_date),2,0),now()  from kiiee_t_0018_2015_3_j;

insert into kiiee_t_0018 (`aik_user_code`,`aik_val_code`,`aik_won_num`,`aik_wowyear_etc`,`aik_wow_confim`,`aik_beg_year`,`aik_beg_month`,`aik_end_year`,`aik_end_month`,`aik_createdate`)
select aik_user_code,'10',15000,year(current_date),'0',year(current_date),lpad(month(current_date),2,0) ,year(current_date)+1,lpad(month(current_date),2,0),now() from kiiee_t_0018_2015_3_p;
end;
-- ---------------------------------------------------

show variables like 'event%';
set global event_scheduler = on;

create event addMembershipFeeEveryOneMonth
on schedule every 1 month
starts '2024-09-01 00:00:01'
comment '매월 1회 회비 자동입력'
do call addMembershipFeeEveryMonth();