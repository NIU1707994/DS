package observer_clock;

import javax.swing.*;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Observer;

public abstract class Clock implements Observer {
  // this is just to have in Main.java a list with digital and analog clocks
  protected int repaintPeriod;    // milliseconds
  protected int hoursOffsetTimeZone;
  protected LocalDateTime lastTimeRepaint;

  protected abstract boolean isTimeToRepaint(LocalDateTime now);

  protected JPanel panel;
  // this is a container class, contains all the elements of the UI

  public abstract void show();
  // every Clock subclass must implement a show()
}
