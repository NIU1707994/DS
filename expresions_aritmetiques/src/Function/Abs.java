package Function;

public class Abs extends BinaryOperator{
  public Abs(Function f1) {
    super(f1);
  }

  @Override
  public DualNumber evaluate(DualNumber dn) {
    DualNumber dn1 = left.evaluate(dn);
    if (dn1.u != 0){
      return new DualNumber(Math.abs(dn1.u), dn1.uprime*Math.signum(dn1.u));
    }
    return new DualNumber(0, 0);
  }

  @Override
  public void prettyPrint() {
    prettyPrint("");
  }
}
