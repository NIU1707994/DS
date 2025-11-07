import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
public static void main(String[] args) {
    String openCode = "1111";
    String fireAlarmCode = "2222";
    String unlockCode = "3333";
    CodeHandler chain1 =
        new Log(new Unlock(unlockCode,
            new FireAlarm(fireAlarmCode,
                new Open(openCode,
                    new Lock(null)))));
    CodeHandler chain2 = new Log(new Open(openCode, null));
    CodeHandler chain3 =
        new Log(
            new FireAlarm(fireAlarmCode,
                new Open(openCode, null)));
    Door d1 = new Door("d1", chain1);

    System.out.println("Chain 1\n");

    d1.processCode("1111"); // opens
    d1.processCode("2222"); // opens and fires alarm
    d1.processCode("1234"); // first trial
    d1.processCode("4321"); // second trial
    d1.processCode("5555"); // third trial, gets locked
    d1.processCode("6666"); // invalid unlock code
    d1.processCode("7777"); // invalid unlock code
    d1.processCode("1111"); // invalid unlock code
    d1.processCode("3333"); // valid unlock code, now can be opened or fire alarm
    d1.processCode("2222"); // opens and fires alarm

    System.out.println("\n-----------------------------------------\n");

    System.out.println("Chain 2\n");
    d1.setCodeHandler(chain2);
    d1.processCode("1111"); // opens
    d1.processCode("1234"); // first trial
    d1.processCode("4321"); // second trial
    d1.processCode("5555"); // third trial, can't get locked
    d1.processCode("5678"); // fourth trial

    System.out.println("\n-----------------------------------------\n");

    System.out.println("Chain 3\n");
    d1.setCodeHandler(chain3);
    d1.processCode("1111"); // opens
    d1.processCode("1234"); // first trial
    d1.processCode("4321"); // second trial
    d1.processCode("5555"); // third trial, can't get locked
    d1.processCode("5678"); // fourth trial
    d1.processCode("2222"); // opens and fires alarm
  }
}