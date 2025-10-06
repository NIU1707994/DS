package pos;

public class PaymentInCashRandom extends PaymentInCash {
  public PaymentInCashRandom(double amountHanded, double amountToPay) {
    super(amountHanded, amountToPay);
  }

  @Override
  protected String change() {
    return "";
  }
}
