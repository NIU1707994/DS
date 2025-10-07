package pos_creditcard;

import java.util.Set;

public class PaymentInCashGreedy extends PaymentInCash {
  public PaymentInCashGreedy(CashBox amountHanded, double amountToPay) {
    super(amountHanded, amountToPay);
  }

  @Override
  protected String change() {
    double amount = amountHanded.total() - amountToPay;
    CashBox exchange = new CashBox();
    if (amount > 0){
      Set<Double> keys = exchange.getKeys();
      for (Double key : keys) {
        if (key <= amount) {
          int quantity = (int) (amount / key);
          exchange.put(key, (int) quantity);
          amount = amount - key * quantity;
        }
      }

      return exchange.toString();
    }
    return "No change";
  }
}
