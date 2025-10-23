package observer_clock;

import javax.swing.*;
import java.time.LocalDateTime;
import java.util.Observer;

public abstract class Widget implements Observer {
  protected int repaintPeriod;
  protected JPanel panel;

  public abstract void show();
  protected abstract boolean isTimeToRepaint(LocalDateTime now);

}
