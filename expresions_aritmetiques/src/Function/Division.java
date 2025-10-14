package Function;

public class Division extends BinaryOperator {
    public Division(Function leftExpression, Function rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public DualNumber evaluate(DualNumber dn) {
      DualNumber dn1 = left.evaluate(dn);
      DualNumber dn2 = right.evaluate(dn);
      if (dn2.u != 0) {
        return new DualNumber(dn1.u / dn2.u, ((dn1.uprime * dn2.u) - (dn1.u * dn2.uprime)) / (dn2.u * dn2.u));
      }
      return new DualNumber(0, 0);
    }

    @Override
    public void prettyPrint() {
        prettyPrint("/");
    }

}
