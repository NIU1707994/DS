package Function;

public class X implements Function {

  public void X()
  {}

  @Override
    public DualNumber evaluate(DualNumber dn) {
    return new DualNumber(dn.u, 1.0);
  }

  @Override
  public void prettyPrint() {
    System.out.println();
  }
}

