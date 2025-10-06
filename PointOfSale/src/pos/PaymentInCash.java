package pos;

public abstract class PaymentInCash extends Payment {
  private double amountHanded;
  public PaymentInCash(double amountHanded, double amountToPay) {
    super(amountToPay);
    this.amountHanded = amountHanded;
  }

  protected abstract String change();

  public double getAmountHanded() {
    return amountHanded;
  }

  @Override
  public void print() {
    System.out.println("Change: " + change());
  }
}
