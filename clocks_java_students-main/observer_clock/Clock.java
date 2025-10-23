package observer_clock;

import javax.swing.*;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Observer;

public abstract class Clock extends Widget {
  // this is just to have in Main.java a list with digital and analog clocks
  protected int hoursOffsetTimeZone;
  protected LocalDateTime lastTimeRepaint;
}
