package Function;

public class Log extends BinaryOperator{
  public Log (Function f1) {
    super(f1);
  }

  @Override
  public DualNumber evaluate(DualNumber dn) {
    DualNumber dn1 = left.evaluate(dn);
    if (dn1.u > 0)
    {
      return new  DualNumber(Math.log(dn1.u),dn1.uprime/ dn1.u);
    }
    return new  DualNumber(0, 0);
  }

  @Override
  public void prettyPrint() {
    prettyPrint("");
  }
}
