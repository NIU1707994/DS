package visitor;

public class Constant implements ArithmeticExpression {
    private double value;
    
    public Constant(double val) {
        value = val;
    }
    
    @Override
    public void acceptVisitor(Visitor v) {
        v.visitConstant(this);
    }

    public double getValue() {
        return value;
    }
}
