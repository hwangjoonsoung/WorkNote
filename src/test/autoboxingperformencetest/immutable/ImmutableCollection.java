package test.autoboxingperformencetest.immutable;

import java.util.List;

public class ImmutableCollection {

    private final int num;
    private final List<Integer> list;

    public ImmutableCollection(int num, List<Integer> list) {
        this.num = num;
        this.list = list;
    }

    public int getNum() {
        return num;
    }

    public List<Integer> getList() {
        return list;
    }
}
