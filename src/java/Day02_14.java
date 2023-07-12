package java;

public class Day02_14 {

    /*DB Connection
        1. JNDI를 이용한 방법을 주로 사용한다.
        2. connection pool을 이용한 방법과 비슷한 방법으로 DB연결을 진행한다.
        3. 일반적으로 connection pool을 사용할 때에는 connection.xml에 DB접속정보를 입력하고 사용한다.
        4. 만약 없는경우 jetty.xml을 이용해서 DB에 연결할 수 있다.

    1: jsp에서 연결하면 사용하는것 같은데? => tomcat에게 DB접속정보를 가져오게 시키는 것이기 때문에 더 빠르겠지?
    -base.open();을 사용하는 경우
        1. javalite.activejdbc가 제공하는 base.open을 이용해서 db에 연결한다.
        2. Base.open("jndiName")을 입력하면 db에 접근이 가능한가?
    
    -InitialContext 사용하는 경우
        1. lookup("jndiName")
    
    ?질문 Base.open으로 DB에 접근하는 방법과 InitialContext로 DB에 접근하는 방법의 차이 : 개발 속도의 차이

    2: java에서 DB접근하는 경우
    -annotation을 사용하는 방법 @resource("jndiName")
    private DataSource datasource
        1. xml에 있는 connection 정보를 가져온다.
        2. getConnection()을 사용해서 db에 접근가능.
     */

    /* ActiveJDBC
    table name : tests
    class name : test
    1)select
        1. Test test = new Test();
        2. test.find();
        2-1. 찾는 값이 다수인 경우 : list
        2-2. 찾는 값이 단일인 경우 : class

     2)insert
        1. Test test = new Test();
        2. test.set("컬럼" , value);
        3-1. test.insert();
        3-2. test.insertIt();

     3)update
        1. Test test = Test.find("where pk = ?", pk);
        2. test.set("컬럼" , value);
        3-1. test.save();
        3-2. test.saveIt();

     4)delete
        1. Test test = Test.find("where pk = ?", pk);
        2. test.delete();

    */


    /*
    Q1) jsp로만 개발 가능한거 아니야? 굳이 java - servlet 으로 갈 필요가 없잖아?
    일단 불편하다.
    Q2) 혹시 model이 DB table name과 일치 해야하나?
    일치해야한다. 이거는 추후 DB접근하면 확인 가능
    Q3) ActiveJDBC대신 hibernate를 사용하는 것은?

    */


}
