package observer_clock;

import javax.swing.*;
import java.awt.*;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Observable;

public class CountDownTimer extends Clock {
  private Duration countDown;
  private Duration startingTime;
  private long amount;
  private ChronoUnit chronoUnit;
  private JLabel clockLabel;
  private LocalDateTime initialTime;

  public CountDownTimer(long amount, ChronoUnit unit) {
    this.repaintPeriod = 1000;
    this.chronoUnit = unit;
    this.amount = amount;
    startingTime = Duration.of(amount, chronoUnit);
    countDown = startingTime;

    panel = new JPanel();
    panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
    panel.setBorder(BorderFactory.createEmptyBorder(5, 45, 5, 45));
    panel.setPreferredSize(new Dimension(500,120));
    clockLabel = new JLabel();
    clockLabel.setFont(new Font(Font.DIALOG, Font.PLAIN, 72));
    clockLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
    panel.add(clockLabel);
    JLabel placeLabel = new JLabel();
    placeLabel.setFont(new Font(Font.DIALOG, Font.PLAIN, 16));
    placeLabel.setText("Count Down");
    placeLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
    panel.add(placeLabel);

    updateClockLabel();

  }
  public void show() {
    JFrame frame = new JFrame();
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.add(panel);
    frame.pack();
    frame.setVisible(true);
  }

  protected boolean isTimeToRepaint(LocalDateTime now) {
    return (this.lastTimeRepaint == null) // the first time
        || (now.minus(this.repaintPeriod, ChronoUnit.MILLIS)
        .isAfter(this.lastTimeRepaint)); // sufficient time has passed
  }


  @Override
  public void update(Observable o, Object arg) {
    LocalDateTime now = (LocalDateTime) arg;
    if (isTimeToRepaint(now)) {
      if (this.lastTimeRepaint == null) {
        initialTime = now;
      }
      this.lastTimeRepaint = now;
      if (!updateCountDown(now))
      {
        o.deleteObserver(this);
      }
      updateClockLabel();
    }
  }

  private boolean updateCountDown(LocalDateTime now) {
    boolean bigger = true;
    Duration elapsed = Duration.between(initialTime, now);
    startingTime = Duration.of(amount, chronoUnit);
    if (startingTime.compareTo(elapsed) <= 0) {
      bigger =  false;
      countDown = Duration.ZERO;
    }
    else {
      countDown = startingTime.minus(elapsed);
    }
    return bigger;
  }

  /*@Override
  public void run() {
    Timer timer = new Timer(repaintPeriod, new ActionListener() {
      @Override

    });
    timer.start();
  }*/

  private void updateClockLabel() {
    // see https://www.geeksforgeeks.org/java/localdatetime-plus-method-in-java-with-examples/

    String formattedCountdown = String.format("%d:%02d:%02d",
        countDown.toHours(),
        countDown.toMinutesPart(),
        countDown.toSecondsPart());

    // see https://www.baeldung.com/java-datetimeformatter
    clockLabel.setText(formattedCountdown);
    // repaint();
    // it seems there is no need to explicitly call repaint()

  }
}
