package visitor;

public class Sum extends BinaryOperator {
    public Sum(ArithmeticExpression leftExpression, ArithmeticExpression rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public void acceptVisitor(Visitor v) {
        v.visitSum(this);
    }

}
