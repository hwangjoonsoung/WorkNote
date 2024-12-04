package javaclass;

import java.util.Stack;

public class DifferentWithPushAndPopInStack {

    public static void main(String[] args) {
        Stack list = new Stack();
        list.add("test1");
        list.add("test2");
        list.add("test3");
        System.out.println(list.push("test Push"));
        System.out.println(list.add("test add"));
        System.out.println(list.pop());
        System.out.println(list.pop());
        System.out.println(list);

    }
}

/*
보면 push와 pop은 동일하게 stack에 데이터를 넣을 수 있다. 그럼 뭐가 다를까?
add()함수를 보면 vector가 제공하고 push는 steck가 제공한다.
return을 보면 add()는 boolean을 리턴하며 push는 자기 자신을 리턴하게 되어 있다.
 */