package visitor;

public abstract class BinaryOperator implements ArithmeticExpression {
    
    public BinaryOperator(ArithmeticExpression leftOperand, ArithmeticExpression rightOperand) {
        left = leftOperand;
        right = rightOperand;
    }

    protected ArithmeticExpression left;

    protected ArithmeticExpression right;

    // these getters are used by the visitors
    public ArithmeticExpression getLeftExpression() {
        return left;
    }

    public ArithmeticExpression getRightExpression() {
        return right;
    }
}
