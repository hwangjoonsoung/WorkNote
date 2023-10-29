import javax.xml.bind.SchemaOutputResolver;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.Stack;

public class testclass {
    public static void main(String[] args) throws IOException, ParseException {

        Stack list = new Stack();
        list.add("test1");
        list.add("test2");
        list.add("test3");
        System.out.println(list.push("test Push"));
        System.out.println(list.add("test add"));
        System.out.println(list.pop());
        System.out.println(list.pop());
        System.out.println(list);
        System.out.println();
        String test = "false";
        System.out.println();

        String test2= "0123456";
        System.out.println(test2.substring(0,4));

    }
}
