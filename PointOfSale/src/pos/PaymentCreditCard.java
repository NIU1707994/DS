package pos;

public class PaymentCreditCard extends Payment {
  private String ccnumber;
  private boolean authorized;
  private double CC_LIMIT;

  public PaymentCreditCard(double amountToPay, String ccnumber) {
    super(amountToPay);
    this.ccnumber = ccnumber;
    authorized = authorize();
  }

  private boolean authorize() {
    return amountToPay <= CC_LIMIT;
  }

  @Override
  public void print() {
    if (authorized) {
      System.out.println("Authorized payment");
    }
    else  {
      System.out.println("Not authorized payment");
    }
  }

  @Override
  public void pay() {

  }

  public boolean isAuthorized() {
    return authorized;
  }
}
