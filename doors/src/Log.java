import java.time.LocalDateTime;

public class Log extends CodeHandler {
  public Log(CodeHandler nextHandler) {
      super(nextHandler);
  }

  protected void handleCode(String code, Door door) {
    System.out.println("Code: " + code + " for Door: " + door.getId() + " at Time: " + LocalDateTime.now() + " Door is: " + (door.isLocked() ? "Locked" : "Unlocked"));
    super.handleCode(code, door);
  };

}
