package visitor;

import java.util.Collection;
import java.util.Iterator;
import java.util.Queue;
import java.util.Stack;

public class Calculator implements Visitor {
    private Stack<Double> stack = new Stack<Double>();

    @Override
    public void visitConstant(Constant c) {
        stack.push(c.getValue());
    }

    @Override
    public void visitSum(Sum s) {
        // postorder : process left child, right child, then s
        s.getLeftExpression().acceptVisitor(this);
        s.getRightExpression().acceptVisitor(this);
        double op1 = stack.pop();
        double op2 = stack.pop();
        stack.push(op1 + op2);
    }

    @Override
    public void visitSubtract(Subtract s) {
        s.getLeftExpression().acceptVisitor(this);
        s.getRightExpression().acceptVisitor(this);
        double op1 = stack.pop();
        double op2 = stack.pop();
        stack.push(op1 - op2);
    }

    @Override
    public void visitProduct(Product p) {
        p.getLeftExpression().acceptVisitor(this);
        p.getRightExpression().acceptVisitor(this);
        double op1 = stack.pop();
        double op2 = stack.pop();
        stack.push(op1 * op2);
    }

    @Override
    public void visitDivision(Division d) {
        d.getLeftExpression().acceptVisitor(this);
        d.getRightExpression().acceptVisitor(this);
        double op1 = stack.pop();
        double op2 = stack.pop();
        stack.push(op1 / op2);
    }

    public double getResult() {
        return stack.pop();
    }
}
