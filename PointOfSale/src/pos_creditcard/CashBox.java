package pos_creditcard;

import java.util.*;

public class CashBox {
  private Map<Double, Integer> coin = new TreeMap<>(Comparator.reverseOrder());

  private void fillCashBox() {
    coin.put(0.01, 0);
    coin.put(0.02, 0);
    coin.put(0.05, 0);
    coin.put(0.1, 0);
    coin.put(0.2, 0);
    coin.put(0.5, 0);
    coin.put(1.0, 0);
    coin.put(2.0, 0);
    coin.put(5.0, 0);
    coin.put(10.0, 0);
    coin.put(20., 0);
    coin.put(50., 0);
  }

  public CashBox() {
    fillCashBox();
  }
  public CashBox(Double key, int quantity)
  {
    fillCashBox();
    assert coin.containsKey(key);
    coin.put(key, quantity);
  }

  public CashBox(Map<Double, Integer> amount) {
    fillCashBox();
    for (Map.Entry<Double, Integer> entry : amount.entrySet()) {
      coin.put(entry.getKey(), entry.getValue());
    }
  }

  public CashBox(double amount)
  {
    fillCashBox();
    if (coin.containsKey(amount)) {
      coin.put(amount, coin.get(amount) + 1);
    }
    else {
      comuteAmount(amount);
    }
  }

  private void comuteAmount(double amount) {
    if (amount > 0) {
      for (Double key : coin.keySet()) {
        if (key >= amount) {
          int quantity = (int) (amount / key);
          coin.put(key, quantity);
          amount = amount - key * quantity;
        }
      }
    }
  }

  public void add(CashBox c) {
    for (Map.Entry<Double, Integer> entry : c.coin.entrySet()) {
      if (c.coin.get(entry.getKey()) > 0) {
        coin.put(entry.getKey(), entry.getValue() +  c.coin.get(entry.getKey()));
      }
      else  {
        coin.put(entry.getKey(), c.coin.get(entry.getKey()));
      }
    }
  }

  public void sub(CashBox c) {
    for (Map.Entry<Double, Integer> entry : c.coin.entrySet()) {
      if (c.coin.get(entry.getKey()) > 0) {
        coin.put(entry.getKey(), entry.getValue() -  c.coin.get(entry.getKey()));
      }
    }
  }

  @Override
  public String toString() {
    String toReturn = "";
    for (Map.Entry<Double, Integer> entry : coin.entrySet()) {
      toReturn += entry.getKey() + ": " + entry.getValue() + "\n";
    }
    return toReturn;
  }

  public boolean greaterEqual(double amountToPay) {
    double total = 0;
    for (Map.Entry<Double, Integer> entry : coin.entrySet()) {
      total += entry.getValue() * entry.getKey();
    }
    return total >= amountToPay;
  }

  public double total() {
    double total = 0;
    for (Map.Entry<Double, Integer> entry : coin.entrySet()) {
      total += entry.getKey()*entry.getValue();
    }
    return total;
  }

  public Set<Double> getKeys() {
    return  coin.keySet();
  }

  public void put(double key, int quantity) {
    coin.put(key, quantity);
  }

  public boolean greater(int i) {
    return total() > i;
  }

  public void setZero() {
    for (Map.Entry<Double, Integer> entry : coin.entrySet()) {
      coin.put(entry.getKey(), 0);
    }
  }
}
