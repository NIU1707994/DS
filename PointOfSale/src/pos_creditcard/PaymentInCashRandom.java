package pos_creditcard;

public class PaymentInCashRandom extends PaymentInCash {
  public PaymentInCashRandom(CashBox amountHanded, double amountToPay) {
    super(amountHanded, amountToPay);
  }

  //This method computes the change to return through random selection of coins.
  @Override
  protected String change() {
    return "";
  }
}
