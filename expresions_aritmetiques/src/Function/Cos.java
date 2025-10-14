package Function;

public class Cos extends BinaryOperator{
  public Cos(Function f1) {
    super(f1);
  }

  @Override
  public DualNumber evaluate(DualNumber dn) {
    DualNumber dn1 = left.evaluate(dn);
    return new DualNumber(Math.cos(dn1.u),-dn1.uprime * Math.sin(dn1.u));
  }

  @Override
  public void prettyPrint() {
    prettyPrint("+");
  }
}
