import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class sqlDatetimeToLocalDateTime {

    public static void main(String[] args) {

        Date date = new Date(0);
        LocalDateTime time = LocalDateTime.now();
        System.out.println("date : "+date);
        System.out.println(time.atZone(ZoneId.of("KOR")));

    }
}
