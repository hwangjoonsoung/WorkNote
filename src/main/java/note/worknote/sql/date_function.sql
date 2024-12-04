
select aik_res_id,aik_res_end_date,aik_res_result_date,review_score1 from chost_tre_0032 ;
update chost_tre_0032 set review_score1 ='4' where DATE_FORMAT(aik_res_result_date , '%Y-%m-%d') <= aik_res_end_date and DATE_FORMAT(aik_res_result_date , '%Y') in('2023' , '2022');
update chost_tre_0032 set review_score1 ='3' where DATE_FORMAT(aik_res_result_date , '%Y-%m-%d') BETWEEN DATE_add(aik_res_end_date ,INTERVAL 1 DAY ) and DATE_add(aik_res_end_date ,INTERVAL 10 DAY )  and DATE_FORMAT(aik_res_result_date , '%Y') in('2023' , '2022');
update chost_tre_0032 set review_score1 ='2' where DATE_FORMAT(aik_res_result_date , '%Y-%m-%d') BETWEEN DATE_add(aik_res_end_date ,INTERVAL 11 DAY ) and DATE_add(aik_res_end_date ,INTERVAL 20 DAY )  and DATE_FORMAT(aik_res_result_date , '%Y') in('2023' , '2022');
update chost_tre_0032 set review_score1 ='1' where DATE_FORMAT(aik_res_result_date , '%Y-%m-%d') >= DATE_add(aik_res_end_date ,INTERVAL 21 DAY ) and DATE_FORMAT(aik_res_result_date , '%Y') in('2023' , '2022');

/*
date_format 을 이용해서 날자 형식을 부여 할 수 있고
date_add를 사용해서 날짜를 더할 수 있다.

*/