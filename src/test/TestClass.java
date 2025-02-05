package test;

public class TestClass {

    public static void main(String[] args) throws CloneNotSupportedException {

        String gcodes = "'02','03','04','05','06','07','08','09','10','11'";

        System.out.println("join = " + gcodes);

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