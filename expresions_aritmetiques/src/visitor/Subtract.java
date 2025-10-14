package visitor;

public class Subtract extends BinaryOperator {
    public Subtract(ArithmeticExpression leftExpression, ArithmeticExpression rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public void acceptVisitor(Visitor v) {
        v.visitSubtract(this);
    }

}
