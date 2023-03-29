import java.util.ArrayList;
import java.util.List;

public class ClickEnventBubbling {

/*
https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=zimny327&logNo=221474775919

*/

    public static void main(String[] args) {

        List lis = new ArrayList<>();
        lis.add("1");
        lis.add("2");
        lis.add("3");
        lis.add("4");
        System.out.println(lis);

        System.out.println(lis.toArray());
        System.out.println(lis.toArray()[0]);



    }
}
