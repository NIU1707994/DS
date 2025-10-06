package pos;

public class PaymentInCashGreedy extends PaymentInCash {
  public PaymentInCashGreedy(double amountHanded, double amountToPay) {
    super(amountHanded, amountToPay);
  }

  @Override
  protected String change() {
    return "Amount";
  }
}
