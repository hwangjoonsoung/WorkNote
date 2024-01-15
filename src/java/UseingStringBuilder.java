package java;

public class UseingStringBuilder {

    public static void main(String[] args) {

        StringBuilder stringBuilder = new StringBuilder();
        int startTime = (int) System.nanoTime();
        int end = 10;
        for (int i = 0; i < end ; i++) {
            stringBuilder.append(i);
        }
        int endedTime = (int) System.nanoTime();
        System.out.println(endedTime-startTime);

        String t = "";
        int startTime2 = (int) System.nanoTime();
        for (int i = 0; i < end ; i++) {
            t+= i;
        }
        int endedTime2 = (int) System.nanoTime();
        System.out.println(endedTime2-startTime2);
    }
}
