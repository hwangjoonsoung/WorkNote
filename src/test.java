import java.util.Locale;

public class test {

    public static void main(String[] args) {

        try {

            if(true){
                throw new NullPointerException();
            }

        }catch (Exception e){
            System.out.println("test");
        }

    }

}

