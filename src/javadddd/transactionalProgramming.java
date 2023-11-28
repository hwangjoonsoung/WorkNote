package javadddd;

public class transactionalProgramming {

    /*
    개요 : 이번 행사에서 데이터를 가져와야 하는데 구조는 table A , table B 가 1:N 관계로 만들어져 있다.
            이때 이거를 transactional하게 구현을 하고 싶어 다양한 시도를 해봤고 그 과정에서 생각한 점을 풀어보겠다.

    case 1 :

    도전방법 : join과 subquery를 사용하여 sql 한 문장으로 입력을 한다.
    insert all
    into fees(goodname , deleted , ended_at , created_at , updated_at , conference_id ) (select goodname , deleted , ended_at , created_at , updated_at , '89' from fees where fees.conference_id= 88 );
    into prices(goodname , price , deleted, membership , is_paid_fee , created_at ) (select goodname , deleted , ended_at , created_at , updated_at , '89' from prices where prices.fee_id BETWEEN (select min(id) from fees where conference_id = 88) and select max(id) from fees where conference_id = 88);
    실패 이유 : insert 하는것 까지는 문제가 없는데 이후 데이터를 수정해 줘야 하기 때문에 부적합하다고 생각.
    과정 : table A , table B 한번에 insert -> table A 이전 데이터를 하나씩 select -> table B에  해당 id로 foreign key modify

    case 2 :

    도전방법 : activejdbc를 이용해서 모든 data를 select 해서 값을 insert
    select d.* , b.* from (select membership.* , membershipcode.*  from kiiee_t_0002 membership right OUTER join prices membershipcode  on membership.aik_code_code = membershipcode.membership where membership.aik_code_val=02 and membershipcode.deleted = 0)
    as d join fees b on d.fee_id = b.id and b.deleted = 0 and d.deleted = 0 and b.conference_id =88;
    실패 이유 : 특정 data를 간추려 뽑아야 한다는 것이 유지보수에 좋은 방법이 아니라 판단했음
    과정 : table A , table B 한번에 join select -> insert

    case 3 (fail):

    도전방법 : 프로시져를 구현
    DELIMITER $$
    drop PROCEDURE if EXISTS insert_price;

    create PROCEDURE insert_price (
    oldconf_id INTEGER , newconf_id INTEGER
    )
    begin
    insert into fees(goodname , deleted , ended_at , created_at , updated_at , conference_id ) (select goodname , deleted , ended_at , created_at , updated_at , newconf_id from fees where fees.conference_id= oldconf_id );
    DECLARE ids cursor for
    select id from fees where conference_id = oldconf_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN ids;
    my_loop : LOOP
    FETCH ids
        insert into prices(goodname , price , deleted, membership , is_paid_fee , created_at , fee_id) (select goodname , price , deleted , membership , is_paid_fee , now() , start_id from prices where fee_id = start_id);
         IF done THEN
          LEAVE my_loop;
        END IF;
    END$$
    DELIMITER;
    실패 이유 : 가능하긴 함, 근데 내가 이해를 못했음 , 어떻게 조작하면 할 수 있을거 같은데...
    과정 : 프로시져 생성 -> 파라미터에 값을 넘길때 해당 conference_id를 넘기면 된다.

    case 4 (success):

    도전방법: table A는 insert를 하고 기존에 있는 data를 select해서 table B insert 할때 변경될 값을 적용한다.
        Base.open("java:comp/env/jdbc/mysql");
        Base.openTransaction();

        List basic_list = Base.findAll("select id from fees where conference_id=? and deleted=0", basic_id);
        Base.exec("insert into fees(goodname , deleted , ended_at , created_at , updated_at , conference_id ) (select goodname , deleted , ended_at , created_at , updated_at , ? from fees where fees.conference_id= ? )", added_id, basic_id);
        List added_list = Base.findAll("select id from fees where conference_id=? and deleted=0", added_id);

        String basic_array[] = listmapToArray(basic_list); //기존 data
        String added_array[] = listmapToArray(added_list); //추가한 data

        for (int i = 0; i < basic_array.length; i++) {
            Base.exec("insert into prices(goodname , price , deleted, membership , is_paid_fee , created_at , fee_id ) (select goodname , price , deleted, membership , is_paid_fee , now() , ? from prices where prices.fee_id = ?)", added_array[i], basic_array[i]);
        }
        Base.commitTransaction();
    과정 : transaction open -> table A insert -> table A 를 기존 id와 insert한 id를 배열로 저장 -> 반복문을 통해 기존 id로 select하고 그 값을 변환시켜서 insert -> commit != rollback
    첨언 :
    1. 해당 기능을 사용하는 사람은 관리자 1명으로 한정되어 있기 때문에 사실 성능을 고려할 필요는 없음.
    2. 중요한건 이렇게 데이터를 넣는 과정이 transactional하게 구현이 되어야 한다는 것이다.

    */


}
