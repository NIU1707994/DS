package visitor;

public class Main {
    public static void main(String[] args) {
        ArithmeticExpression one = new Constant(1.0);
        // could be also Constant one = ...
        ArithmeticExpression two = new Constant(2.0);
        ArithmeticExpression three = new Constant(3.0);
        // 3*(2+1)
        ArithmeticExpression expr = new Product(new Sum(one, two), three);

        Visitor printer = new Printer();
        expr.acceptVisitor(printer);
        System.out.println();

        Calculator calculator = new Calculator(); // can not be Visitor because of getResult
        expr.acceptVisitor(calculator);
        System.out.println("result = " + calculator.getResult());
    }
}
