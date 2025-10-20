package observer_clock;

import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class Main {
  public static void main(String[] args) {
    ClockTimer clockTimer = new ClockTimer(10);
    Clock countDown = new CountDownTimer(4, ChronoUnit.SECONDS);
    clockTimer.addObserver(countDown);
    countDown.show();
    /*List<Clock> clocks = new ArrayList<>(List.of(
        new AnalogClock(0, "Cerdanyola, Catalonia"),
        new DigitalClock(-9, "Anchorage, Alaska"),
        new AnalogClock(3, "Moscow, Russia"),
        new DigitalClock(-7, "Sonora, Mexico"),
        new AnalogClock(-1, "Berlin, Germany"),
        new DigitalClock(-4, "Yerevan, Armenia")
    ));
    // see https://www.geeksforgeeks.org/java/initialize-an-arraylist-in-java/
    for (Clock clock : clocks) {
      clockTimer.addObserver(clock);
      clock.show();
    }*/
  }
}