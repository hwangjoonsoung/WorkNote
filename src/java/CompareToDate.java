package java;

import java.time.LocalDateTime;

public class CompareToDate {

    /*
    특이하게 이후날자를 비교하는 것은 day 단위로  비교 되지만 이전 날자를 비교하는 것은 month단위로 비교가 된다.

     */
    public static void main(String[] args) {

    LocalDateTime now = LocalDateTime.now();
    LocalDateTime nowp13 = now.plusDays(13);
    LocalDateTime nowm13 = now.minusDays(50);

        System.out.println(now.compareTo(nowp13));
        System.out.println(now.compareTo(nowm13));
    }


}
