1. tomcat log 가 not wirteable인 경우
2. tomcat에 대한 권한이 없기 때문에 발생하는 문제다.
3. 해당 dir에서 pwd해보면 권한이 webcric일텐데, tomcat으로 running하기 때문에 Not writeable이 log에 찍힌다.
4. 이를 해결하기 위해서 모든 권한을 부여하는 777권한을 부여하면 된다.
5. 방법은 다음과 같다.
   1. 해당 dir 이전으로 이동
   2. sudo chmod 777 [directory name] => 예) sudo chmod 777 booth
   3. ll로 write 가능 확인
6. upload Test 진행