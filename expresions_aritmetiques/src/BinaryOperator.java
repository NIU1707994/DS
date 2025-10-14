public abstract class BinaryOperator implements ArithmeticExpression {
    
    public BinaryOperator(ArithmeticExpression leftOperand, ArithmeticExpression rightOperand) {
        left = leftOperand;
        right = rightOperand;
    }

    protected ArithmeticExpression left;

    protected ArithmeticExpression right;

    protected void prettyPrint(String symbolOperator) {
        System.out.print("(");
        left.prettyPrint();
        System.out.print(")");
        System.out.print(symbolOperator);
        System.out.print("(");
        right.prettyPrint();
        System.out.print(")");
    }
}
