package ui;

import pos.CashBox;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AmountListener implements ActionListener {
  JTextField textField;
  private Mediator mediator;

  public AmountListener(JTextField textField, Mediator mediator) {
    this.textField = textField;
    this.mediator = mediator;
  }

  @Override
  public void actionPerformed(ActionEvent actionEvent) {
    CashBox amount = new  CashBox(Double.parseDouble(textField.getText()));
    mediator.setPaidAmount(amount);
  }
}
