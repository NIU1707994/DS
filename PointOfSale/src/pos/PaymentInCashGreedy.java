package pos;

import java.util.Set;

public class PaymentInCashGreedy extends PaymentInCash {
  public PaymentInCashGreedy(CashBox amountHanded, double amountToPay) {
    super(amountHanded, amountToPay);
  }
  //Computes the optimal way to return the change if there is any.
  @Override
  protected String change() {
    if (amountToPay > 0) {
      double amount = amountHanded.total() - amountToPay;
      CashBox exchange = new CashBox();
      if (amount > 0.001){
        Set<Double> keys = exchange.getKeys();
        for (Double key : keys) {
          if (key <= amount) {
            int quantity = (int) (amount / key);
            exchange.put(key, quantity);
            amount = amount - key * quantity;
          }
        }
        amountToPay = 0;
        amountHanded = exchange;
        return exchange.toString();
      }
      return "No change";
    }
    return amountHanded.toString();
  }
}
