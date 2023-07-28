import com.sun.org.apache.xalan.internal.xsltc.dom.SortingIterator;

import java.time.LocalDate;
import java.util.*;

public class test {

    public static void main(String[] args) {

        LocalDate now = LocalDate.now();
        LocalDate now2 = LocalDate.now().plusDays(2);
        System.out.println(now);
        System.out.println(now2);
        System.out.println(now.compareTo(now2));

}}

