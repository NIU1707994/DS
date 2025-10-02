package pos;

public class SaleLineItem {
  private ProductSpecification productSpecification;
  private int quantity;

  public SaleLineItem(ProductSpecification productSpecification, int quantity) {
    this.productSpecification = productSpecification;
    this.quantity = quantity;
  }

  public ProductSpecification getProductSpecification() {
    return productSpecification;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setProductSpecification(ProductSpecification productSpecification) {
    this.productSpecification = productSpecification;
  }

  public void incrementQuantity(int qty) {
    quantity += qty;
  }

  public double subtotal() {
    return quantity * productSpecification.getPrice();
  }

  public void print() {
    System.out.printf("%s %d x %.2f = %.2f\n", productSpecification.getName(), quantity,
        productSpecification.getPrice(), subtotal());
  }
}
