package observer_clock;

import java.time.LocalDateTime;
import java.util.Observable;
import java.util.Observer;
import java.util.Timer;
import java.util.TimerTask;

public class ClockTimer extends Observable {
  private Timer timer;
  private int period;

  public ClockTimer(int period) {
    this.period = period;

    TimerTask timerTask = new TimerTask() {
      @Override
      public void run() {
        setChanged();
        notifyObservers(LocalDateTime.now());
      }
    };
    timer = new Timer();
    timer.schedule(timerTask, period, period);
  }

  public int getPeriod() {
    return period;
  }
}
