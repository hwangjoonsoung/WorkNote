package java;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class UsingGenericInClass2 {


    public static void main(String[] args) {
        Box<Apple> box = new Box();
        box.addList(new Apple(new Date() , 1 , "서울"));
        box.addList(new Apple(new Date() , 1 , "서울"));
        box.addList(new Apple(new Date() , 1 , "서울"));
        box.addList(new Apple(new Date() , 1 , "서울"));
        box.addList(new Apple(new Date() , 1 , "서울"));
//        box.addList(new Banana(new Date() , 1 , "서울"));

    }

}

class Apple{

    Date createDate;
    int id;
    String where;

    public Apple(Date createDate, int id, String where) {
        this.createDate = createDate;
        this.id = id;
        this.where = where;
    }
}


class Banana{

    Date createDate;
    int id;
    String where;

    public Banana(Date createDate, int id, String where) {
        this.createDate = createDate;
        this.id = id;
        this.where = where;
    }
}


class Box<T> {

    List<T> list = new ArrayList();

    public Box() {
    }

    public Box(List<T> list) {
        this.list = list;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public void addList(T test){
        list.add(test);
    }

}



