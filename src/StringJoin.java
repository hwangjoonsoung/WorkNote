import java.io.OutputStream;

public class StringJoin {

    public static void main(String[] args) {

        double reaultF;
        double reaultS;
        int count = 0;

        for (int a = 1; a <= 100; a++) {
            for (int b = 1; b <= 100; b++) {
                for (int c = 1; c <= 100; c++) {
                    for (int d = 1; d <= 100; d++) {
                        reaultF = Math.pow(a, 3.0 / 1.0) + Math.pow(b, 3.0 / 1.0);
                        reaultS = Math.pow(c, 3.0 / 1.0) + Math.pow(d, 3.0 / 1.0);

                        System.out.println(reaultF);
                        System.out.println(reaultS);
                        System.out.println("======");
                        if (reaultF == reaultS) {
                            count++;
                        }
                    }
                }
            }
        }

        for (int c = 1; c <= 10; c++) {
            int d = 1;
            for (; d <= 10; d++) {

                System.out.println("c : " + c);
                System.out.println("d : " + d);

            }
        }



    }
}