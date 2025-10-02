package pos;

public abstract class Payment {
  protected double amountToPay; // Euros
  public Payment(double amount) {
    this.amountToPay = amount;
  }

  public double getAmountToPay() {
    return amountToPay;
  }

  public abstract void print();
  public abstract void pay();
}
