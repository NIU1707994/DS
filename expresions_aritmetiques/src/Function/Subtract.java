package Function;

public class Subtract extends BinaryOperator {
    public Subtract(Function leftExpression, Function rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public DualNumber evaluate(DualNumber dn) {
      DualNumber dn1 = left.evaluate(dn);
      DualNumber dn2 = right.evaluate(dn);
      return new DualNumber(dn1.u-dn2.u, dn1.uprime-dn2.uprime);
    }

    @Override
    public void prettyPrint() {
        prettyPrint("-");
    }

}
