import com.sun.deploy.net.HttpRequest;
import com.sun.javafx.fxml.expression.Expression;
import javafx.application.Application;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.*;
import java.util.regex.Pattern;

public class TestClass {

    public static void main(String[] args) {

        int score = 0;
        LocalDate now = LocalDate.parse("2023-06-14");
        LocalDate deadline = LocalDate.parse("2023-05-15");
        LocalDate deadline_10 = deadline.plusDays(10);
        LocalDate deadline_20 = deadline.plusDays(20);
        System.out.println("now : "+now);
        System.out.println("deadline : "+deadline);
        System.out.println("deadline_10 : "+deadline_10);
        System.out.println("deadline_20 : "+deadline_20);


        if (now.isBefore(deadline) || now.isEqual(deadline)) {
            //최초 논문심사가간 내 심사완료시 (4점)
            score = 4;
        } else if ((now.isAfter(deadline) && now.isBefore(deadline_10))||now.isEqual(deadline_10)) {
            //최초 논문심사기간 + 10일 내 심사완료시  (3점)
            score = 3;
        } else if ((now.isAfter(deadline_10) && now.isBefore(deadline_20)) || now.isEqual(deadline_20)) {
            //최초 논문심사기간 + 20일 내 심사완료시  (2점)
            score = 2;
        } else if (now.isAfter(deadline_20)) {
            //최초 논문심사기간 + 20일 초가 심사완료시  (1점)
            score = 1;
        } else {
            //미심사시 (0점)
            score = 0;
        }
        System.out.println(score);

    }
}
