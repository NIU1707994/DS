package Function;

public class Constant implements Function {
    private double value;
    
    public Constant(double val) {
        value = val;
    }

  @Override
  public DualNumber evaluate(DualNumber dn) {
    return new DualNumber(value, 0);
  }

  @Override
    public void prettyPrint() {
        System.out.print(value);
    }
}
