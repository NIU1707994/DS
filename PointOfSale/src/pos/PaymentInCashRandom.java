package pos;

import java.util.Random;
import java.util.Set;

public class PaymentInCashRandom extends PaymentInCash {
  public PaymentInCashRandom(CashBox amountHanded, double amountToPay) {
    super(amountHanded, amountToPay);
  }
  //This method computes the change to return through random selection of coins.
  //Each one of equal or less value than the amount to return
  @Override
  protected String change() {
    if (amountToPay > 0) {
      double amount = amountHanded.total() - amountToPay;
      CashBox exchange = new CashBox();
      if (amount > 0) {
        Set<Double> keys = exchange.getKeys();
        Double[] keyArray = keys.toArray(new Double[keys.size()]);
        while (amount > 0.001) {

          int rand = new Random().nextInt(keys.size());
          double key = keyArray[rand];
          if (key <= amount && ((amount - key) >= 0)) {
            amount -= key;
            exchange.addOne(key);
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
