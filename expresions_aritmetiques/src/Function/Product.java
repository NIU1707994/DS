package Function;

public class Product extends BinaryOperator {
    public Product(Function func1, Function func2) {
        super(func1, func2);
    }

    @Override
    public DualNumber evaluate(DualNumber dn) {
      DualNumber dn1 = left.evaluate(dn);
      DualNumber dn2 = right.evaluate(dn);
      return new DualNumber(dn1.u * dn2.u, dn1.uprime*dn2.u+ dn1.u*dn2.uprime);
    }

    @Override
    public void prettyPrint() {
        prettyPrint("*");
    }

}
