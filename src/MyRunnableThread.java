public class MyRunnableThread implements Runnable {


    @Override
    public void run() {
        for(int i = 0; i < 100 ; i++){
            System.out.println(Thread.currentThread().getName() +" : "+  i);
        }
    }



}

class tzzzzz{


    public static void main(String[] args) {

     /*   Thread thread2 = new Thread(new Runnable(){
            @Override
            public void run() {
                for(int i = 0; i < 100 ; i++){
                    System.out.println(Thread.currentThread().getName() +" : "+  i);
                }
            }
        });


        MyRunnableThread thread = new MyRunnableThread();
        thread.run();

        thread2.start();*/

        try {
            System.out.println("start");
            throw new Exception();

        }catch (Exception e){
            System.out.println("except");
        }finally {
            System.out.println("final");
        }
        System.out.println("end");


    }


}