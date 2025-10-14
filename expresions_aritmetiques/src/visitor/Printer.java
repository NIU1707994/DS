package visitor;

public class Printer implements Visitor {
    private void printBinaryExpression(BinaryOperator operator, String symbol) {
        // inorder : process left child of operator, then operator, then right child of operator
        System.out.print("(");
        operator.getLeftExpression().acceptVisitor(this);
        System.out.print(")");
        System.out.print(" " + symbol + " ");
        System.out.print("(");
        operator.getRightExpression().acceptVisitor(this);
        System.out.print(")");
    }
    public void visitConstant(Constant c) {
        System.out.print(c.getValue());
    }

    public void visitSum(Sum sum) {
        printBinaryExpression(sum, "+");
    }

    public void visitSubtract(Subtract subtract) {
        printBinaryExpression(subtract, "-");
    }

    public void visitProduct(Product product) {
        printBinaryExpression(product, "*");
    }

    public void visitDivision(Division division) {
        printBinaryExpression(division, "/");    }
}
