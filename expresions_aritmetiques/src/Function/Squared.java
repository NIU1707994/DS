package Function;

public class Squared extends BinaryOperator {
  public Squared(Function f1){
    super(f1);
  }

  @Override
  public DualNumber evaluate(DualNumber dn) {
    DualNumber dn1 = left.evaluate(dn);
    if (dn1.u != 0)
    {
      return new DualNumber(Math.pow(dn1.u, 2), 2*dn1.u* dn1.uprime);
    }
    return new  DualNumber(0,0);
  }

  @Override
  public void prettyPrint() {
    prettyPrint("");
  }
}
