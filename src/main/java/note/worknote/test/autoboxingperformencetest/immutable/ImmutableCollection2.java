package test.autoboxingperformencetest.immutable;

import java.util.ArrayList;
import java.util.List;

public class ImmutableCollection2 {

    private final List<Amount> amounts;

    public ImmutableCollection2(List<Amount> amounts) {
        this.amounts = new ArrayList<>(amounts);
    }

    public List<Amount> getAmounts() {
        return amounts;
    }
}
