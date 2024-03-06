package javaclass;

import java.util.StringJoiner;

public class UsefulStringClassMethid {

    //1.배열의 각 index와 특수문자를 사용하여 string 만들기
    String[] strArr = {"Kim", "Park", "Hwang", "Lee"};
    String arrString = String.join(",", strArr);

    //2.배열의 각 index와 특수문자를 사용하여 string 만든 후 prefix와 suffix로 감싸기
    StringJoiner stringJoiner = new StringJoiner(",", "[", "]");

    public static void main(String[] args) {
        UsefulStringClassMethid usefulStringClassMethid = new UsefulStringClassMethid();
        System.out.println(usefulStringClassMethid.arrString);

        for (String s : usefulStringClassMethid.strArr){
            usefulStringClassMethid.stringJoiner.add(s);
        }

        System.out.println(usefulStringClassMethid.stringJoiner);
    }

}
