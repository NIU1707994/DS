

public class Product extends BinaryOperator {
    public Product(ArithmeticExpression leftExpression, ArithmeticExpression rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public double calculate() {
        return left.calculate() * right.calculate();
    }

    @Override
    public void prettyPrint() {
        prettyPrint("*");
    }

}
