package pos_creditcard;

import java.util.ArrayList;
import java.util.Set;

public class PaymentInCashGreedy extends PaymentInCash {
  public PaymentInCashGreedy(CashBox amountHanded, double amountToPay) {
    super(amountHanded, amountToPay);
  }

  //This method computes the change from the maximum coin value 50 to the minimum 0.01
  //and if the coin value is less than the amount to pay calculates the number of coins
  //with the same value it can give
  @Override
  protected String change() {
    double amount = amountHanded.total() - amountToPay;
    CashBox exchange = new CashBox();
    if (amount > 0){
      Set<Double> keys = exchange.getKeys();
      for (Double key : keys) {
        if (key >= amount) {
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
