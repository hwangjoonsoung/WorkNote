import javax.lang.model.element.NestingKind;
import java.lang.reflect.Constructor;
import java.util.Arrays;
import java.util.stream.StreamSupport;

public class testclass extends test222222{
    public static void main(String[] args){
        testclass.test(1,2,3,4,5,6,7,89,14);
    }

    static void  test (int ... val){
        System.out.println(val instanceof  int[]);
        Arrays.stream(val).forEach(value ->
                System.out.println(value));
    }


}

class  test222222 extends test222 {
    public test222222() {
        System.out.println("test222222");
    }
}
class  test222 {
    public test222() {
        System.out.println("test222");

    }
}