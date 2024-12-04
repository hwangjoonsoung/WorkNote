package test.autoboxingperformencetest.immutable;

public class Amount {

    private int val;

    public int getVal() {
        return val;
    }

    public void setVal(int val) {
        this.val = val;
    }

    public Amount(int val) {
        this.val = val;
    }

    @Override
    public String toString() {
        return "Amount{" +
                "val=" + val +
                '}';
    }
}
