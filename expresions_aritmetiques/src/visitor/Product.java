package visitor;

public class Product extends BinaryOperator {
    public Product(ArithmeticExpression leftExpression, ArithmeticExpression rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public void acceptVisitor(Visitor v) {
        v.visitProduct(this);
    }

}
