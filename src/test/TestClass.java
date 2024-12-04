package test;

public class TestClass {

    public static void main(String[] args) throws CloneNotSupportedException {
        Guest guest = new Guest("name1", 20);
        Room room1 = new Room("room1", guest);
        Room room2 = (Room)room1.clone();
        System.out.println("room1 = " + room1.toString());
        System.out.println("room2 = " + room2.toString());

        System.out.println(room1.guest.toString());
        System.out.println(room2.guest.toString());
        room1.guest.setAge(100);
        room1.guest.setName("guest1");
        System.out.println(room1.guest.toString());
        System.out.println(room2.guest.toString());
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