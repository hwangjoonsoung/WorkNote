package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class test {

    public static void main(String[] args) throws ParseException {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(formatter.parse(""));

        test test = new test();
        test.of();
    }

    public test of() {

        return this;
    }
}