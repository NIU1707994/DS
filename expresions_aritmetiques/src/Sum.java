

public class Sum extends BinaryOperator {
    public Sum(ArithmeticExpression leftExpression, ArithmeticExpression rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public double calculate() {
        return left.calculate() + right.calculate();
    }

    @Override
    public void prettyPrint() {
        prettyPrint("+");
    }
}
