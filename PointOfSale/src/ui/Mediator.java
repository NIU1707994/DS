package ui;

import pos.CashBox;
import pos.PointOfSale;

import javax.swing.*;

public class Mediator {
  JButton selectedTable;
  JTextField textAmount; // to set it to 0.0 once a payment is made
  CashBox paidAmount = new CashBox(10., 2);
  private final PointOfSale pointOfSale;
  private TableListener currentTableListener;

  public Mediator(PointOfSale pointOfSale, JTextField textAmount) {
    this.pointOfSale = pointOfSale;
    this.textAmount = textAmount;
  }

  public void setSelectedTable(JButton table) {
    selectedTable = table;
    currentTableListener = (TableListener) table.getActionListeners()[0];
    // knows the id of its current sale, if any
  }

  public void makeNewSale() {
    if (currentTableListener != null) {
      if (currentTableListener.hasASale()) {
        int currentSaleId = currentTableListener.getSaleId();
        if (pointOfSale.isSalePaid(currentSaleId)) {
          int saleId = pointOfSale.makeNewSale();
          currentTableListener.setSaleId(saleId);
        } else {
          System.out.println("Current sale of table " + selectedTable.getText() + " has not been paid yet");
        }
      } else {
        int saleId = pointOfSale.makeNewSale();
        currentTableListener.setSaleId(saleId);
      }
    }
  }

  public void printReceipt() {
    if (currentTableListener != null) {
      if (currentTableListener.hasASale()) {
        int id = currentTableListener.getSaleId();
        pointOfSale.printReceiptOfSale(id);
      } else {
        System.out.println("Table " + selectedTable.getText() + " has no sale yet");
      }
    }
  }

  public void pay(String changeMaking) {
    if (currentTableListener != null) {
      if (currentTableListener.hasASale()) {
        int id = currentTableListener.getSaleId();
        if (!pointOfSale.isSalePaid(id) && (paidAmount.greater(0))) {
          pointOfSale.payOneSaleCash(id, paidAmount, changeMaking);
          pointOfSale.printPayment(id);
          paidAmount.setZero();
          textAmount.setText("0.0");
        } else {
          System.out.println("Sale of table " + selectedTable.getText() + " has already been paid");
        }
      }
    }
  }

  public void setPaidAmount(CashBox amount) {
    assert amount.greater(0);
    paidAmount = amount;
  }

  public void addLineItem(String productName, int quantity) {
    if (currentTableListener != null) {
      if (currentTableListener.hasASale()) {
        int idSale = currentTableListener.getSaleId();
        pointOfSale.addLineItemToSale(idSale, productName, quantity);
      } else {
        System.out.println("Table " + selectedTable.getText() + " has no sale yet");
      }
    }
  }

}
