import java.io.File;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class test {

    public static void main(String[] args) {

        String p = "1,2,3,4,5,6,7,7";
        String [] pArr = p.split(",");
        Set<String> pList = new HashSet<>(Arrays.asList(pArr));
        System.out.println(pList);


    }


}
