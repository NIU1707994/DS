package Function;

public class Sin extends BinaryOperator{
  public Sin(Function function) {
    super(function);
  }

  @Override
  public DualNumber evaluate(DualNumber dn) {
    DualNumber dn1 = left.evaluate(dn);
    return new DualNumber(Math.sin(dn1.u), dn1.uprime*Math.cos(dn1.u));
  }

  @Override
  public void prettyPrint() {
    prettyPrint("");
  }
}
