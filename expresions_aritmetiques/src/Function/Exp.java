package Function;

public class Exp extends BinaryOperator{
  public Exp(Function f1) {
    super(f1);
  }

  @Override
  public DualNumber evaluate(DualNumber dn) {
    DualNumber dn1 = left.evaluate(dn);
    return new DualNumber(Math.exp(dn1.u),dn1.uprime*Math.exp(dn1.u));
  }

  @Override
  public void prettyPrint() {
    prettyPrint("");
  }
}
