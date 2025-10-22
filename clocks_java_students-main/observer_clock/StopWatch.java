package observer_clock;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Observable;


// adapted from https://stackoverflow.com/questions/67553152/how-do-i-create-a-clock-using-timer
public class StopWatch extends Clock {
    private JLabel clockLabel;
    private JButton startStopButton;
    private Duration countTime;
    private Observable o;
    boolean active = false;

    public StopWatch() {
        countTime = Duration.ZERO;

        panel = new JPanel();
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
        panel.setBorder(BorderFactory.createEmptyBorder(5, 45, 5, 45));
        panel.setPreferredSize(new Dimension(500,120));
        clockLabel = new JLabel();
        clockLabel.setFont(new Font(Font.DIALOG, Font.PLAIN, 72));
        clockLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        panel.add(clockLabel);
        updateClockLabel();
        this.repaintPeriod = 10;
        startStopButton = new JButton("Start");
        startStopButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                startStopButtonPressed();
            }

        });
        panel.add(startStopButton);
    }

    private void startStopButtonPressed() {
        if (startStopButton.getText().equals("Stop")){
            this.o.deleteObserver(this);
            active = false;
            startStopButton.setText("Start");
        }
        else  {
            this.o.addObserver(this);
            active = true;
            startStopButton.setText("Stop");
        }

    }

    @Override
    public void update(Observable o, Object arg) {
        if (this.o == null){
            this.o = o;
            this.o.deleteObserver(this);
        }

        if (isTimeToRepaint((LocalDateTime) arg) && active) {
            this.lastTimeRepaint = (LocalDateTime) arg;
            updateClockLabel();
        }
    }

    @Override
    protected boolean isTimeToRepaint(LocalDateTime now) {
        return (this.lastTimeRepaint == null ||
                now.minus(this.repaintPeriod, ChronoUnit.MILLIS).isAfter(lastTimeRepaint));
    }

    public void show() {
        JFrame frame = new JFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.add(panel);
        frame.pack();
        frame.setVisible(true);
    }

    public void updateClockLabel() {
        countTime = countTime.plus(repaintPeriod,  ChronoUnit.MILLIS);

        // see https://www.geeksforgeeks.org/java/localdatetime-plus-method-in-java-with-examples/

        String formattedCountdown = String.format("%d:%02d:%02d:%02d",
                countTime.toHours(),
                countTime.toMinutesPart(),
                countTime.toSecondsPart(),
                countTime.toMillisPart());

        // see https://www.baeldung.com/java-datetimeformatter
        clockLabel.setText(formattedCountdown);
        // repaint();
        // it seems there is no need to explicitly call repaint()

    }

}
