package visitor;

public interface Visitor {
    public void visitConstant(Constant c);
    public void visitSum(Sum s);
    public void visitSubtract(Subtract s);
    public void visitProduct(Product p);
    public void visitDivision(Division d);
}
