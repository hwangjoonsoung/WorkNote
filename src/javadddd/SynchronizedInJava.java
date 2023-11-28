package javadddd;

class DummyClass{

}
public class SynchronizedInJava {

    private static DummyClass instance;
    String test;

    public static DummyClass getInstance(){
        if(instance == null){
            synchronized (DummyClass.class){
                instance = new DummyClass();
            }
        }
        return instance;
    }

}
/*
위 코드를 보면 Dummyclass를 동기화 시켜주는 것을 볼 수 있다.
가장 많이 사용하는 예로는 사용자가 변경될 수 있는 값을 read하는 경우에 동기화를 많이 사용할 수 있는데.
그 동기화를 해주기 위해서 접근할수 없는 클래스를 인스턴스로 두고
synchronized를 사용해서 해당 클레스를 동기화 시켜준 후 instance에 새로운 객체를 부여한다.
 */