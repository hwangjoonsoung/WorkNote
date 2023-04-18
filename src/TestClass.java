import com.sun.deploy.net.HttpRequest;
import com.sun.javafx.fxml.expression.Expression;
import javafx.application.Application;

import java.sql.Date;
import java.time.ZoneId;
import java.util.*;
import java.util.regex.Pattern;

public class TestClass {

    public static void main(String[] args) {

        String a = "1`223`4`516``8`9";
        String [] b = a.split("`");

        for (int i=0; i<b.length;i++){
            System.out.println(b[i]);
        }


    }
}
