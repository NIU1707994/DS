public class Constant implements ArithmeticExpression {
    private double value;
    
    public Constant(double val) {
        value = val;
    }
    
    @Override
    public double calculate() {
        return value;
    }

    @Override
    public void prettyPrint() {
        System.out.print(value);
    }
}
