package test.autoboxingperformencetest.boxing;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class AutoBoxingTest implements Runnable {

//    private final Map<Integer, BoxingInteger> boxingMap = new HashMap<>();
    private final Map<Integer, Boxing> boxingMap = new HashMap<>();

    public AutoBoxingTest() {
        int size = 10000;

        for (int i = 0; i < size; i++) {
//            boxingMap.put(Integer.valueOf(i), new BoxingInteger(Integer.valueOf(i)));
            boxingMap.put(i, new Boxing(i));
        }

    }

    @Override
    public void run() {
        long yieldCounter = 0;
//        while (true) {
//            Collection<BoxingInteger> values = boxingMap.values();
//            for (BoxingInteger value : values) {
//                if (!boxingMap.containsKey(value.getA())) {
//                    System.out.println("filed");
//                }
//
//                if (++yieldCounter % 1000 == 0) {
//                    System.out.println("still running");
//                }
//            }
//            Thread.yield();
//        }

        while (true) {
            Collection<Boxing> values = boxingMap.values();
            for (Boxing value : values) {
                if (!boxingMap.containsKey(value.getA())) {
                    System.out.println("filed");
                }

                if (++yieldCounter % 1000 == 0) {
                    System.out.println("still running");
                }
            }
            Thread.yield();
        }
    }

    public static void main(String[] args) throws IOException {

        ThreadGroup threadGroup = new ThreadGroup("workers");
        Thread[] thread = new Thread[8];
        for (int i = 0; i < thread.length; i++) {
            thread[i] = new Thread(threadGroup, new AutoBoxingTest(), "thead : " + i);
            thread[i].setDaemon(true);
            thread[i].start();
        }
        System.out.println("press To quit");
        System.out.flush();
        System.in.read();

    }
}

