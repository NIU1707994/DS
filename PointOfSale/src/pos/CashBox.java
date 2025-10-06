package pos;

import java.util.Map;

public class CashBox {
  Map<String, Integer> coin = Map.of(
      "0.1", 0,
      "0.2", 0,
      "0.5", 0,
      "1", 0,
      "2", 0,
      "5", 0,
      "10", 0,
      "20", 0,
      "50", 0
  );

  public CashBox(String name, int quantity) {
    coin.put(name, quantity);
  }

  public CashBox add(CashBox c) {
    for (Map.Entry<String, Integer> entry : c.coin.entrySet()) {
      if (c.coin.get(entry.getKey()) > 0) {
        coin.put(entry.getKey(), entry.getValue() +  c.coin.get(entry.getKey()));
      }
      else  {
        coin.put(entry.getKey(), c.coin.get(entry.getKey()));
      }
    }
    return this;
  }

  public CashBox sub(CashBox c) {
    for (Map.Entry<String, Integer> entry : c.coin.entrySet()) {
      if (c.coin.get(entry.getKey()) > 0) {
        coin.put(entry.getKey(), entry.getValue() -  c.coin.get(entry.getKey()));
      }
    }
    return this;
  }

  @Override
  public String toString() {
    String toReturn = "";
    for (Map.Entry<String, Integer> entry : coin.entrySet()) {
      toReturn += entry.getKey() + ": " + entry.getValue() + "\n";
    }
    return toReturn;
  }
}
