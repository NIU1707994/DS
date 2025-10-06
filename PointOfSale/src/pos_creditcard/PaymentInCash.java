package pos_creditcard;

public abstract class PaymentInCash extends Payment {
  CashBox amountHanded;

  public PaymentInCash(CashBox amountHanded, double amountToPay) {
    super(amountToPay);
    assert amountHanded.greaterEqual(amountToPay);
    this.amountHanded = amountHanded;
  }

  protected abstract String change();

  @Override
  public void print() {
    System.out.printf("\nAmount handed : %.2f\nChange : %.2f\n", amountHanded, change());
  }
}
