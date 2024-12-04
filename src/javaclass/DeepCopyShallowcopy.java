package javaclass;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class DeepCopyShallowcopy {

    public static void main(String[] args) {
        List list1 = new ArrayList();
        list1.add(1);

        List list2 = list1;
        System.out.println("list1 = " + list1);
        System.out.println("list2 = " + list2);
        list1.add(0,"test");

        System.out.println("index0 chang list1 = " + list1);
        System.out.println("index0 chang list2 = " + list2);

        //deep copy
        List deepCoptList = new ArrayList();
        Collections.copy(list1 , deepCoptList);
        System.out.println(list1);
        System.out.println(deepCoptList);


    }
}
