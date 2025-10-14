package visitor;

public class Division extends BinaryOperator {
    public Division(ArithmeticExpression leftExpression, ArithmeticExpression rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public void acceptVisitor(Visitor v) {
        v.visitDivision(this);
    }

}
