public class EnumTest {


    public static void main(String[] args) {
        Enums enums1 = Enums.test1;
        EnumTest enumTest = new EnumTest();
        System.out.println(enums1);

        System.out.println(Enums.test1);

    }

}


enum Enums{
    test,
    test1,
    test2,
    test3,
    test4
}