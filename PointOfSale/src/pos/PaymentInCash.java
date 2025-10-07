package pos;

public abstract class PaymentInCash extends Payment {
  protected CashBox amountHanded;
  public PaymentInCash(CashBox amountHanded, double amountToPay) {
    super(amountToPay);
    this.amountHanded = amountHanded;
  }

  protected abstract String change();

  public CashBox getAmountHanded() {
    return amountHanded;
  }

  @Override
  public void print() {
    System.out.println("Change: " + change());
  }
}
