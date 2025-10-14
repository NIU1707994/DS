package Function;

public class Main {
    public static void main(String[] args) {
      Function halfPi = new Constant(3.141592/2.0);
      Function x = new X();
      Function function = new Sin(new Sum(halfPi, new Squared(x)));

      DualNumber result = function.evaluate(new DualNumber(4.0, 1));

      System.out.println("U = " + result.u + "\nUprime = " + result.uprime);


      System.out.println();
    }
}
