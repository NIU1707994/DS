package pos;

public class PaymentInCash extends Payment {
  private double amountHanded;
  public PaymentInCash(double amountToPay, double amountHanded) {
    super(amountToPay);
    this.amountHanded = amountHanded;
  }

  protected double change() {
    double change = amountToPay - amountHanded; // better than sale.total(), avoids a dependence
    assert change >= 0;
    return change;
  }

  public double getAmountHanded() {
    return amountHanded;
  }

  @Override
  public void print() {
    System.out.println("Change: " + change());
  }

  @Override
  public void pay() {

  }
}
