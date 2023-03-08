import java.sql.Date;
import java.time.ZoneId;
import java.util.*;

public class TestClass {

    public static void main(String[] args) {


        java.sql.Date now = new Date(new java.util.Date());
        System.out.println(now.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());


    }


}
