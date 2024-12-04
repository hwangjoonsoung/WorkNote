package javaclass;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class StringToDate {

    public static void main(String[] args) {

        String meetingNoticeDate = "2023-02-21";

        LocalDate date = LocalDate.parse(meetingNoticeDate);
        System.out.println(date.getClass().getName());
        String formattedDate = date.format(DateTimeFormatter.ofPattern("yyyy년 M월 d일 (E)", Locale.KOREAN));
        System.out.println(formattedDate);
    }
}
