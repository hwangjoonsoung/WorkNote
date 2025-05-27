package test;

public class TestClass {

    public static void main(String[] args) throws CloneNotSupportedException {


        String order_id = "MC45MDM3MDI2Njk2MDcx_4353";
        System.out.println(order_id.indexOf("_")+1);
        String id = order_id.substring(order_id.indexOf("_")+1);
        System.out.println("id : "+id);
    }
}

class Room implements Cloneable {
    String name;
    Guest guest;

    public Room(String name, Guest guest) {
        this.name = name;
        this.guest = guest;
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    @Override
    public String toString() {
        return "Room{" +
                "name='" + name + '\'' +
                ", guest=" + guest +
                '}';
    }
}

class Guest{
    String name ;
    int age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Guest(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString() {
        return "Guest{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }
}