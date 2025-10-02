package pos;

public class PaymentInCash extends Payment {
  private double amountHanded;
  public PaymentInCash(double amountToPay, double amountHanded) {
    super(amountToPay);
    this.amountHanded = amountHanded;
  }

  public double change(double totalSale) {
    double change = amountHanded - totalSale; // better than sale.total(), avoids a dependence
    assert change >= 0;
    return change;
  }

  public double getAmountHanded() {
    return amountHanded;
  }

  @Override
  public void print() {
    System.out.println("\nAmount handed: %.2f\n" + "Change: %.2f\n", amountHanded, change());
  }

  @Override
  public void pay() {

  }
}
