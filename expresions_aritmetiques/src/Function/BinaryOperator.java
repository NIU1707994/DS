package Function;

public abstract class BinaryOperator implements Function {
    
    public BinaryOperator(Function leftOperand, Function rightOperand) {
        left = leftOperand;
        right = rightOperand;
    }

    protected Function left;

    protected Function right;

  public BinaryOperator(Function function) {
    left = function;
  }

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
