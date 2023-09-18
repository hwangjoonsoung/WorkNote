package java;

import java.util.ArrayList;

public class UsingGenericInClass {

    public static void main(String[] args) {

        /*
        봐야 할 부분
        1. InstanceOfClass라는 이름을 가진 클래스는 generic 선언이 <T> 로 아무 타입을 설정할 수 있다.
        2. InstanceOfClass라는 이름을 가진 클래스는 generic으로 인해서 integer만 입력이 가능하다.
        3. 따라서 list가 generic으로 인해서 type이 결정되면 2번에서 설정한 integer type만 입력이 가능하고 다른 타입은 입력이 불가능 하다.
        4. 그레서 stringArrayList가 입력이 불가능 하다.
         */
        InstanceOfClass<Integer> instanceOfClass = new InstanceOfClass();

        if(instanceOfClass instanceof InstanceOfClass ){
            System.out.println("true");
        }else{
            System.out.println("false");
        }

        ArrayList<Integer> integerArrayList = new ArrayList<>();
        ArrayList<String> stringArrayList = new ArrayList<>();
        integerArrayList.add(1);
        integerArrayList.add(2);
        integerArrayList.add(3);
        instanceOfClass.setArrayList(integerArrayList);

        stringArrayList.add("1");
        stringArrayList.add("2");
        stringArrayList.add("3");
//        instanceOfClass.setArrayList(stringArrayList);
    }
}


class InstanceOfClass<T> {

    private ArrayList<T> arrayList ;

    public ArrayList<T> getArrayList() {
        return arrayList;
    }

    public void setArrayList(ArrayList<T> arrayList) {
        this.arrayList = arrayList;
    }
}
