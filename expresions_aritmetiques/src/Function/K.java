package Function;

public class K extends BinaryOperator{
  private int k;
  public K(Function f1, int k){
    super(f1);
    this.k = k;
  }

  @Override
  public DualNumber evaluate(DualNumber dn) {
    DualNumber dn1 = left.evaluate(dn);
    if (dn1.u != 0)
    {
      return new DualNumber(Math.pow(dn1.u, k), k*Math.pow(dn1.u, k-1)* dn1.uprime);
    }
    return new  DualNumber(0,0);
  }

  @Override
  public void prettyPrint() {
    prettyPrint("");
  }
}
