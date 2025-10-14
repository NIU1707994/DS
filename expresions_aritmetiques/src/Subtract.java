

public class Subtract extends BinaryOperator {
    public Subtract(ArithmeticExpression leftExpression, ArithmeticExpression rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public double calculate() {
        return left.calculate() - right.calculate();
    }

    @Override
    public void prettyPrint() {
        prettyPrint("-");
    }

}
